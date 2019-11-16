//
//  SettingVC.swift
//  settingDemo
//
//  Created by Mohammad Kiani on 2019-11-15.
//  Copyright © 2019 mohammadkiani. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameField.text = UserDefaults.standard.string(forKey: "name_preference")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func userNameChanged(_ sender: UITextField) {
        
        UserDefaults.standard.set(userNameField.text, forKey: "name_preference")
    }
    
}
