//
//  ViewController.swift
//  settingDemo
//
//  Created by Mohammad Kiani on 2019-11-15.
//  Copyright © 2019 mohammadkiani. All rights reserved.
//

import UIKit

class FoodVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var foods: [String]!
    let price: [Double] = [0.5, 0.1, 15, 5, 2, 20]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "FoodList", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        foods = (dict?.object(forKey: "Foods") as! [String])
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @objc func willEnterForeground() {
        tableView.reloadData()
    }

}

extension FoodVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foodCount = UserDefaults.standard.integer(forKey: "slider_preference")
        return min(foodCount, foods.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
        let name = foods[indexPath.row]
        cell.textLabel?.text = name
        cell.imageView?.image = UIImage(named: name)
        let currency = UserDefaults.standard.string(forKey: "user_currency")
        cell.detailTextLabel?.text = (currency == "CAD" ? String(format: "%.2f $ CAD", price[indexPath.row]) : String(format: "%.2f $ USD", price[indexPath.row] / 1.3) )
        return cell
    }
    
    
}

