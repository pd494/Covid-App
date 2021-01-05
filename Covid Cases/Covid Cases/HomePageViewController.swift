//
//  HomePageViewController.swift
//  Covid Cases
//
//  Created by Prasanth Dendukuri on 8/11/20.
//  Copyright © 2020 Prasanth Dendukuri. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, CovidManagerDelegate
{
    
    
    
    @IBOutlet weak var worldCasesView: UIView!
    
    var c = CovidStatsManager()
    
    @IBOutlet weak var casesLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        worldCasesView.layer.cornerRadius = 15
        worldCasesView.frame.size.height = 10
        c.delegate2 = self
        c.performRequest(with: "https://covid-19.dataflowkit.com/v1/world")

    }
    
    @IBAction func tabChanged(_ sender: UISegmentedControl)
    {
        var s = ViewController()

        if sender.selectedSegmentIndex == 1
        {
            s.updateSegment(sender)

            self.performSegue(withIdentifier: "segue", sender: (Any).self)
        }
        else{
            s.dismiss(animated: true, completion: nil)
        }
    }
    func updateView(statsModel: StatsModel)
    {
        DispatchQueue.main.async
        {
            self.casesLabel.text = statsModel.totalCases
        }
    }
    
}
