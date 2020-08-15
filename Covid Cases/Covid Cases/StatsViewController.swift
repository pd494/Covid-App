//
//  StatsViewController.swift
//  Covid Cases
//
//  Created by Prasanth Dendukuri on 8/8/20.
//  Copyright © 2020 Prasanth Dendukuri. All rights reserved.
//

import UIKit
import Foundation

class StatsViewController: UIViewController, CovidManagerDelegate {
        
    var countryName:String = ""
    
    var c = CovidStatsManager()
    
    @IBOutlet weak var casesLabel: UILabel!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        c.delegate = self
        
        countryName = countryName.replacingOccurrences(of: " ", with: "%20")
        c.fetchCountry(countryName: countryName)
    }
    

    
    func updateView(statsModel: StatsModel) {
        DispatchQueue.main.async {
            self.casesLabel.text = statsModel.totalCases
        }
    }
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
