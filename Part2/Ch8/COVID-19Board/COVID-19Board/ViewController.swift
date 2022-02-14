//
//  ViewController.swift
//  COVID-19Board
//
//  Created by choi hyunjin on 2022/02/07.
//

import UIKit
import Charts
import Alamofire

class ViewController: UIViewController {
	@IBOutlet weak var totalCaseLabel: UILabel!
	@IBOutlet weak var newCaseLabel: UILabel!
	@IBOutlet weak var indicator: UIActivityIndicatorView!
	
	@IBOutlet weak var labelStackView: UIStackView!
	@IBOutlet weak var pieChart: PieChartView!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.labelStackView.isHidden = true
		self.pieChart.isHidden = true
		
		self.indicator.color = .black
		self.indicator.hidesWhenStopped = true
		self.indicator.isHidden = false
		self.indicator.startAnimating()
		
		self.fetchCovidOverview(completionHandler: {[weak self] result in
			guard let self = self else { return }
			switch result {
			case let .success(result):
				self.configureStackView(koreaCovidOverview: result.korea)
				let overviewList = self.makeCovidOverviewList(cityCovid: result)
				self.configureChartView(covidOverviewList: overviewList)
			case let .failure(error):
				debugPrint("failure \(error)")
			}
			self.indicator.isHidden = true
			self.labelStackView.isHidden = false
			self.pieChart.isHidden = false
		})
	
	}
	
	func configureStackView(koreaCovidOverview : CovidOverview){
		if let totalCaseLabel = self.totalCaseLabel {
			totalCaseLabel.text = "\(koreaCovidOverview.totalCase)명"
		}
		if let newCaseLabel = self.newCaseLabel {
			newCaseLabel.text = "\(koreaCovidOverview.newCase)명"
		}
	}

	func makeCovidOverviewList(cityCovid: CityCovidOverview) -> [CovidOverview] {
		return [cityCovid.korea,
						cityCovid.busan,
						cityCovid.chungbuk,
						cityCovid.chungnam,
						cityCovid.daegu,
						cityCovid.daejeon,
						cityCovid.gangwon,
						cityCovid.gwangju,
						cityCovid.gyeongbuk,
						cityCovid.gyeonggi,
						cityCovid.gyeongnam,
						cityCovid.incheon,
						cityCovid.jeju,
						cityCovid.seoul]
	}
	
	func configureChartView(covidOverviewList : [CovidOverview]){
		self.pieChart.delegate = self
		let entries = covidOverviewList.compactMap{ [weak self] overview -> PieChartDataEntry? in
			guard let self = self else { return nil }
			return PieChartDataEntry(value: self.formatString(string: overview.newCase), label: overview.countryName, data: overview)
		}
		
		let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
		dataSet.sliceSpace = 1
		dataSet.entryLabelColor = .white
		dataSet.xValuePosition = .outsideSlice
		dataSet.valueLinePart1OffsetPercentage = 0.8
		dataSet.valueLinePart1Length = 0.2
		dataSet.valueLinePart2Length = 0.3
		dataSet.colors = ChartColorTemplates.vordiplom() + ChartColorTemplates.pastel() + ChartColorTemplates.joyful() + ChartColorTemplates.colorful()
		dataSet.valueTextColor = .black
		self.pieChart.spin(duration: 0.3, fromAngle: self.pieChart.rotationAngle, toAngle: self.pieChart.rotationAngle + 80)
		
		self.pieChart.data = PieChartData(dataSet: dataSet)
	}
	
	func formatString(string: String) -> Double{
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		return formatter.number(from: string)?.doubleValue ?? 0.0
	}
	
	func fetchCovidOverview(completionHandler : @escaping (Result<CityCovidOverview, Error>) -> Void){
		let url = "https://api.corona-19.kr/korea/country/new/"
		let param = [
			"serviceKey": "qk3QCAX7TPvIjNbgrOLM8UZdH9lB5xsWm"
		]
		
		AF.request(url, method: .get, parameters: param)
			.responseData(completionHandler: { response in
				switch response.result{
				case let .success(data):
					do {
						let decoder = JSONDecoder()
						let result = try decoder.decode(CityCovidOverview.self, from: data)
						completionHandler(.success(result))
					}catch{
						completionHandler(.failure(error))
					}
					
				case let .failure(error):
					completionHandler(.failure(error))
				}
				
			})
	}

}

extension ViewController : ChartViewDelegate{
	func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
		debugPrint("1")
		guard let covidDetailVC = self.storyboard?.instantiateViewController(identifier: "CovidDetailViewController") as? CovidDetailViewController else {return}
		debugPrint("1")
		guard let covidOverview = entry.data as? CovidOverview else { return }
		debugPrint("1")
		covidDetailVC.covidOverview = covidOverview
		debugPrint("1")
		self.navigationController?.pushViewController(covidDetailVC, animated: true)
	}
}
