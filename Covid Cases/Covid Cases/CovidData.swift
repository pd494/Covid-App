//
//  CovidData.swift
//  Covid Cases
//
//  Created by Prasanth Dendukuri on 8/8/20.
//  Copyright © 2020 Prasanth Dendukuri. All rights reserved.
//

import Foundation


struct CovidData: Decodable
{
    let activeCases: String
    let country: String
    let newCases: String
    let newDeaths: String
    let totalCases: String
    let totalDeaths: String
    let totalRecovered: String
    
    enum CodingKeys: String, CodingKey
    {
        case activeCases = "Active Cases_text"
        case country = "Country_text"
        case newCases = "New Cases_text"
        case newDeaths = "New Deaths_text"
        case totalCases = "Total Cases_text"
        case totalDeaths = "Total Deaths_text"
        case totalRecovered = "Total Recovered_text"
    }
    
}
