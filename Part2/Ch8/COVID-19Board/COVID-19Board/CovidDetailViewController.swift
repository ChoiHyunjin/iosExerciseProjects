//
//  CovidDetailViewController.swift
//  COVID-19Board
//
//  Created by choi hyunjin on 2022/02/07.
//

import UIKit

class CovidDetailViewController: UITableViewController {
	@IBOutlet weak var newCaseSell: UITableViewCell!
	@IBOutlet weak var totalCaseSell: UITableViewCell!
	@IBOutlet weak var recoveredCaseSell: UITableViewCell!
	@IBOutlet weak var deadCaseSell: UITableViewCell!
	@IBOutlet weak var occuredCaseSell: UITableViewCell!
	@IBOutlet weak var abroadCaseSell: UITableViewCell!
	@IBOutlet weak var localCaseSell: UITableViewCell!
	
	var covidOverview : CovidOverview?
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configureView()
	}

	func configureView(){
		guard let covidOverview = self.covidOverview else { return }
		self.title = covidOverview.countryName
		self.newCaseSell.detailTextLabel?.text = "\(covidOverview.newCase)명"
		self.totalCaseSell.detailTextLabel?.text = "\(covidOverview.totalCase)명"
		self.recoveredCaseSell.detailTextLabel?.text = "\(covidOverview.recovered)명"
		self.deadCaseSell.detailTextLabel?.text = "\(covidOverview.death)명"
		self.occuredCaseSell.detailTextLabel?.text = "\(covidOverview.percentage)명"
		self.abroadCaseSell.detailTextLabel?.text = "\(covidOverview.newFcase)명"
		self.localCaseSell.detailTextLabel?.text = "\(covidOverview.newCcase)명"
	}
    
}
