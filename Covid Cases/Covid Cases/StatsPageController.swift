//
//  StatsPageController.swift
//  Covid Cases
//
//  Created by Raghav Punnam on 8/9/20.
//  Copyright © 2020 Prasanth Dendukuri. All rights reserved.
//

import UIKit

class StatsPageController: UIViewController, CovidManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countryName: String = ""
    
    var covidManager = CovidStatsManager()

    
    var dataArray = [ViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        covidManager.delegate = self
        
        
        tableView.register(UINib(nibName: "ViewDataCell", bundle: nil), forCellReuseIdentifier: "ViewDataTableViewCell")
        tableView.dataSource = self
        
        countryName = countryName.replacingOccurrences(of: " ", with: "%20")
        covidManager.fetchCountry(countryName: countryName)
    }
    
    //MARK: - JSON View Update
    func updateView(statsModel: StatsModel) {
        DispatchQueue.main.async {
            self.dataArray.append(ViewData(content: "Country", value: self.countryName.replacingOccurrences(of: "%20", with: " ")))
            self.dataArray.append(ViewData(content: "Cases", value: statsModel.totalCases))
            self.tableView.reloadData()
        }
    }
    
}

//MARK: - Table View DataSource
extension StatsPageController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentData = dataArray[indexPath.row]
        
        //let cell = Bundle.main.loadNibNamed("ViewDataTableViewCell", owner: self, options: nil)?.first as! ViewDataCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewDataTableViewCell", for: indexPath) as! ViewDataCell
        
        cell.contentLabel.text = currentData.content
        cell.valueLabel.text = currentData.value
        
        return cell
    }
    
}

