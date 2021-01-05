//
//  ViewController.swift
//  Covid Cases
//
//  Created by Prasanth Dendukuri on 8/7/20.
//  Copyright © 2020 Prasanth Dendukuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var currentIndex: Int = 0

    
    @IBOutlet weak var searchTextBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    // Array of all the countries in the World
    var countries = ["Afghanistan", "Åland Islands", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua And Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia, Plurinational State Of", "Bonaire, Sint Eustatius And Saba", "Bosnia And Herzegovina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, The Democratic Republic Of The", "Cook Islands", "Costa Rica", "Côte D'ivoire", "Croatia", "Cuba", "Curaçao", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-bissau", "Guyana", "Haiti", "Heard Island And Mcdonald Islands", "Holy See (vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran, Islamic Republic Of", "Iraq", "Ireland", "Isle Of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic Of", "Korea, Republic Of", "Kuwait", "Kyrgyzstan", "Lao People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macao", "Macedonia, The Former Yugoslav Republic Of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States Of", "Moldova, Republic Of", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Palestine, State Of", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Réunion", "Romania", "Russian Federation", "Rwanda", "Saint Barthélemy", "Saint Helena, Ascension And Tristan Da Cunha", "Saint Kitts And Nevis", "Saint Lucia", "Saint Martin (french Part)", "Saint Pierre And Miquelon", "Saint Vincent And The Grenadines", "Samoa", "San Marino", "Sao Tome And Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Sint Maarten (dutch Part)", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia And The South Sandwich Islands", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard And Jan Mayen", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province Of China", "Tajikistan", "Tanzania, United Republic Of", "Thailand", "Timor-leste", "Togo", "Tokelau", "Tonga", "Trinidad And Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks And Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "USA", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela, Bolivarian Republic Of", "Viet Nam", "Virgin Islands", "Virgin Islands, U.s.", "Wallis And Futuna", "Western Sahara", "Yemen", "Zambia", "Zimbabwe"];
    
    var searchCountry = [String]()
    var searching = false
    var selectedCountry: String = ""
    
    var clickedTable = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       // navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if searching{
            return searchCountry.count
        }
        else
        {
            return countries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if searching
        {
            cell?.textLabel?.text = searchCountry[indexPath.row]
        }
        else{
            cell?.textLabel?.text = countries[indexPath.row]
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        clickedTable = true
        if clickedTable && searching
        {
            selectedCountry = searchCountry[indexPath.row]
                        
        }
        else
        {
            selectedCountry = countries[indexPath.row]
        }
        
        
       // self.performSegue(withIdentifier: "segue", sender: self)
        self.performSegue(withIdentifier: "ShowViewData", sender: self)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ShowViewData" {
            let destinationVC = segue.destination as! StatsPageController
            destinationVC.countryName = selectedCountry
        }
    }
    
}

extension ViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        //searchCountry = countries.filter({$0.prefix(searchText.count) == searchText})
        
        searchCountry = []
        
        for countryName in countries {
            if countryName.lowercased().contains(searchText.lowercased()) {
                searchCountry.append(countryName)
            }
        }
        
        searching = searchText != ""
        
        tableView.reloadData()
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searching = false
        tableView.reloadData()
    
        searchBar.endEditing(true)
    }
    
    func updateSegment(_ sender: UISegmentedControl)
    {
        sender.isEnabledForSegment(at: 1)
    }
    
    
    
    
    
}
