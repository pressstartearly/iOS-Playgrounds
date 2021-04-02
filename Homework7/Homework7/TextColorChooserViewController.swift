//
//  TextColorChooserViewController.swift
//  Homework7
//
//  Created by Caleb Chapman on 4/1/21.
//

import UIKit

class TextColorChooserViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Constant array with each hex digit
    let hexNums = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    
    // Outlets
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var selectColorLabel: UILabel!
    
    // RGB array to store the RGB values
    var rgb = [0,0,0]
    
    @IBAction func dismissColorChooser(_ sender: UIButton) {
        let controller = presentingViewController as! ViewController
        // Sets the text color for the label on the initial view
        controller.itemLabel.textColor = UIColor(red: (CGFloat)(rgb[0])/255.0, green: (CGFloat)(rgb[1])/255.0, blue: (CGFloat)(rgb[2])/255.0, alpha: 1.0)
        
        // Saves our selections to the variables in the intitial view
        controller.hex = [
            colorPicker.selectedRow(inComponent: 0),
            colorPicker.selectedRow(inComponent: 1),
            colorPicker.selectedRow(inComponent: 2),
            colorPicker.selectedRow(inComponent: 3),
            colorPicker.selectedRow(inComponent: 4),
            colorPicker.selectedRow(inComponent: 5),
        ]
        controller.rgb = rgb
        
        dismiss(animated: true, completion: nil)
    }
    
    // We need 6 components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }
    
    // 0-F is 16 options
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 16
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        // Creates the UI Label and sets the background color
        let compenantLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 32))
        compenantLabel.backgroundColor = UIColor.clear
        
        // Sets each label to a hex number
        compenantLabel.text = hexNums[row]
        
        return compenantLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 55.0
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // Get the hex number for red then sets transforms it into a decimal
        let redHex = hexNums[colorPicker.selectedRow(inComponent: 0)] + hexNums[colorPicker.selectedRow(inComponent: 1)]
        rgb[0] = (Int)(strtoul(redHex, nil, 16))
        
        // Get the hex number for green then sets transforms it into a decimal
        let greenHex = hexNums[colorPicker.selectedRow(inComponent: 2)] + hexNums[colorPicker.selectedRow(inComponent: 3)]
        rgb[1] = (Int)(strtoul(greenHex, nil, 16))
        
        // Get the hex number for blue then sets transforms it into a decimal
        let blueHex = hexNums[colorPicker.selectedRow(inComponent: 4)] + hexNums[colorPicker.selectedRow(inComponent: 5)]
        rgb[2] = (Int)(strtoul(blueHex, nil, 16))
        
        // update the GUI
        updateGUI()
        
    }
    
    func updateGUI() {
        
        // Updates the decimal values for each color that is displayed
        redValueLabel.text = "\(rgb[0])"
        greenValueLabel.text = "\(rgb[1])"
        blueValueLabel.text = "\(rgb[2])"
        
        // Updates the preview color
        selectColorLabel.textColor = UIColor(red: (CGFloat)(rgb[0])/255.0, green: (CGFloat)(rgb[1])/255.0, blue: (CGFloat)(rgb[2])/255.0, alpha: 1.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let controller = presentingViewController as! ViewController
        
        // Sets the RGB value from what was saved in the controller variable
        rgb = controller.rgb
        
        // Sets all the hex rows to their correct values based on what is stored in the controller variable
        for i in 0...5 {
            colorPicker.selectRow(controller.hex[i], inComponent: i, animated: false)
        }
        
        // Make sure our GUI is up to date!
        updateGUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
