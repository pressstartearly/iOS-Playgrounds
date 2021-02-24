//
//  ViewController.swift
//  Homework3
//
//  Created by Caleb Chapman on 2/10/21.
//  CSC308

import UIKit

class ViewController: UIViewController {
    
    // UI Elements

    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var genderSelector: UISegmentedControl!
    
    @IBOutlet weak var weightUnitSelector: UISegmentedControl!
    
    @IBOutlet weak var reportView: UITextView!
    
    @IBOutlet weak var lengthUnitSelector: UISegmentedControl!
    
    @IBOutlet weak var weightInput: UITextField!
    
    @IBOutlet weak var waistInput: UITextField!
    
    // hide keyboard action
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    // Template for report
    var template = "Hello there, <name>! Thank you for using the body fat calculator 6000. Your body fat percentage is estimated to be <bodyfat>%, according to the YMCA method."
    
    // On click of the report button
    @IBAction func getReport(_ sender: UIButton) {
        var report = template
        // replaceing the placeholders in the template before displaying it to the user.
        report = report.replacingOccurrences(of: "<name>", with: name.text!)
        report = report.replacingOccurrences(of: "<bodyfat>", with: String(format: "%.2f", getBodyFat()))
        
        // displaying report to user
        reportView.text = report
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Custom function that does all the conversions and calculations. I added this to keep the code more organized and clean.
    func getBodyFat() -> Double {
        var bodyfat = 0.0
        // unwraps values only if they are not null
        if var weight = Double(weightInput.text!), var waist = Double(waistInput.text!) {
            
            // Checks if we are using metric. If so converts to imperial
            if(weightUnitSelector.selectedSegmentIndex != 0) {
                weight = weight / 0.45359237
            }
            // Checks if we are using metric. If so converts to imperial
            if(lengthUnitSelector.selectedSegmentIndex != 0) {
                waist = waist / 2.54
            }
            // Performas the YMCA bodyfat calculation depending on the selected gender
            if(genderSelector.selectedSegmentIndex == 0) {
                let calc = (-98.42 + 4.15 * waist - 0.082 * weight) / weight
                bodyfat = Double(calc)
            } else {
                let calc = (-76.76 + 4.15 * waist - 0.082 * weight) / weight
                bodyfat = Double(calc)
            }
        }
        // returns the value in a percentage
        return Double(bodyfat*100)
    }
}

