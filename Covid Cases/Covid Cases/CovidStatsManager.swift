//
//  CovidStats.swift
//  Covid Cases
//
//  Created by Prasanth Dendukuri on 8/7/20.
//  Copyright © 2020 Prasanth Dendukuri. All rights reserved.
//

import Foundation

protocol CovidManagerDelegate {
    func updateView(statsModel: StatsModel)
}

struct CovidStatsManager
{
    let covidURL = "https://covid-19.dataflowkit.com/v1/"
    
    var delegate: CovidManagerDelegate?
    var delegate2: CovidManagerDelegate?
    
    func fetchCountry(countryName: String)
    {
        let urlString = "\(covidURL)\(countryName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String)
    {
        // create a Url
        if let url = URL(string: urlString)
        {
            // create a url session
            let session = URLSession(configuration: .default)
           
            // create a task for the session
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil
                {
                    if let safeData = data
                    {
                        if let covidData = self.parseJSON(safeData)
                        {
                            self.delegate?.updateView(statsModel: covidData)
                            self.delegate2?.updateView(statsModel: covidData)
                        }
                    }
                }
            }

            // start the task
            task.resume()
        }
    }
    
    func parseJSON(_ covidData: Data) -> StatsModel?
    {
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(CovidData.self, from: covidData)
            let totalC = decodedData.totalCases
            let a = StatsModel(totalCases: totalC)
            return a

        }
        catch
        {
            return nil
        }
        
        
    }
    
}
