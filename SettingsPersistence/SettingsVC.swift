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
    @IBOutlet weak var coolMeterSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
    }
    
    @IBAction func didSlideCoolSlider(_ sender: UISlider) {
        coolMeterValueLabel.text = String(format: "%.0f", sender.value)
    }
    
    func loadSettings() {
        guard
            let settingsDictionary = UserDefaults.standard.dictionary(forKey: "settings"),
            let firstName = settingsDictionary["firstName"] as? String,
            let lastName = settingsDictionary["lastName"] as? String,
            let likesDevelopment = settingsDictionary["likesDevelopment"] as? Bool,
            let coolMeterValue = settingsDictionary["coolMeterValue"] as? Int
            else { return }
        
        firstNameTextField.text = firstName
        lastNameTextField.text = lastName
        likesDevelopmentToggle.isOn = likesDevelopment
        coolMeterValueLabel.text = String(coolMeterValue)
        coolMeterSlider.value = Float(coolMeterValue)
    }
    
    func saveSettings() {
        let settingsDictionary: [String: Any?] = ["firstName": firstNameTextField.text,
                                                  "lastName": lastNameTextField.text,
                                                  "likesDevelopment": likesDevelopmentToggle.isOn,
                                                  "coolMeterValue": Int(coolMeterSlider.value)]
        UserDefaults.standard.set(settingsDictionary, forKey: "settings")
    }
    
    func didSaveAlert() {
        let alert = UIAlertController(title: "Saved Settings", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 2, indexPath.row == 0 else { return }
        saveSettings()
        didSaveAlert()
    }
}
