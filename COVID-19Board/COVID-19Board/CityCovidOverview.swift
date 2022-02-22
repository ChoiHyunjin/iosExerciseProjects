//
//  CovidOverview.swift
//  COVID-19Board
//
//  Created by choi hyunjin on 2022/02/07.
//

import Foundation

struct CityCovidOverview: Codable{
	let resultCode: String
	let resultMessage: String
	let korea: CovidOverview
	let seoul: CovidOverview
	let busan: CovidOverview
	let daegu: CovidOverview
	let incheon: CovidOverview
	let gwangju: CovidOverview
	let daejeon: CovidOverview
	let ulsan: CovidOverview
	let sejong: CovidOverview
	let gyeonggi: CovidOverview
	let gangwon: CovidOverview
	let chungbuk: CovidOverview
	let chungnam: CovidOverview
	let jeonbuk: CovidOverview
	let jeonnam: CovidOverview
	let gyeongbuk: CovidOverview
	let gyeongnam: CovidOverview
	let jeju: CovidOverview
	let quarantine: CovidOverview
}

struct CovidOverview: Codable {
	let countryName: String
	let totalCase: String
	let newCase : String
	let death : String
	let recovered : String
	let percentage: String
	let newCcase: String
	let newFcase: String
}
