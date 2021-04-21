//
//  SettingsViewController.swift
//  daily.activity
//
//  Created by Caleb Chapman on 4/14/21.
//

import UIKit

struct Settings {
    var name = ""
    var weight = 0.0
    var age = 0
    var height = 0.0
    var male = false
    var metric = true
}

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        150
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        55
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        settings.male = (row != 0)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let componentLabel = UILabel(frame: CGRect(x: 0, y:0, width: 140, height: 32))
        
        componentLabel.backgroundColor = UIColor.clear
        
        if (row == 0) {
            componentLabel.text = "Female"
        } else {
            componentLabel.text = "Male"
        }
        return componentLabel
    }
    
    var settings = Settings()

    //labels
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    // textfields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    // the other stuff
    @IBOutlet weak var unitSwitch: UISegmentedControl!
    @IBOutlet weak var sexSelector: UIPickerView!
    
    // on the unit switching being toggled
    @IBAction func unitChanged(_ sender: UISegmentedControl) {
        settings.metric = !settings.metric
        if (settings.metric) {
            weightLabel.text = "Weight (kg)"
            heightLabel.text = "Height (cm)"
        } else {
            weightLabel.text = "Weight (inches)"
            heightLabel.text = "Height (lb)"
        }
    }
    
    // on the end of editing any box, we update all the settings
    @IBAction func onEditEnd(_ sender: UITextField) {
        settings.name = nameTextField.text ?? ""
        settings.weight = Double(weightTextField.text!) ?? 0.0
        settings.age = Int(ageTextField.text!) ?? 0
        settings.height = Double(heightTextField.text!) ?? 0.0
        
        updateGUI()
    }
    
    func updateGUI() {
        
        // Setting customized welcome message
        if (settings.name != "") {
            welcomeLabel.text = "Welcome, \(settings.name)!"
        } else {
            welcomeLabel.text = "Welcome!"
        }
        
        // Setting the unit switch correctly
        if (settings.metric) {
            unitSwitch.selectedSegmentIndex = 0
        } else {
            unitSwitch.selectedSegmentIndex = 1
        }
        
        // Setting all the text fields to their correct values
        nameTextField.text = settings.name
        weightTextField.text = "\(settings.weight)"
        ageTextField.text = "\(settings.age)"
        heightTextField.text = "\(settings.height)"
        
    }
    
    // hide keyboard action
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGUI()
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
