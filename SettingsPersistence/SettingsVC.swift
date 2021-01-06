//
//  SettingsVC.swift
//  SettingsPersistence
//
//  Created by Anna Sibirtseva on 06/01/2021.
//

import UIKit

class SettingsVC: UITableViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var likesDevelopmentToggle: UISwitch!
    @IBOutlet weak var coolMeterValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didSlideCoolSlider(_ sender: UISlider) {
        coolMeterValueLabel.text = String(format: "%.0f", sender.value)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 2 else { return }
        print("save")
    }
}
