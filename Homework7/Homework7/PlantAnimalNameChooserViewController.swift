//
//  PlantAnimalNameChooserViewController.swift
//  Homework7
//
//  Created by Caleb Chapman on 4/1/21.
//

import UIKit

class PlantAnimalNameChooserViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var plantAnimalChooser: UIPickerView!
    
    let categoryComponent = 0
    let itemComponent = 1
    
    @IBAction func dismissObjectChooser(_ sender: UIButton) {
        let controller = presentingViewController as! ViewController
        
        // Next we need to change the item compment selected int into a index that we can use to get the key for the text
        let itemKeyIndex = controller.AnimalsPlants["\(controller.currentSelectedCategory)"]!.index(controller.AnimalsPlants["\(controller.currentSelectedCategory)"]!.startIndex, offsetBy: plantAnimalChooser.selectedRow(inComponent: itemComponent))
        
        // Updates the currentSelectedItem variable
        controller.currentSelectedItem = (controller.AnimalsPlants["\(controller.currentSelectedCategory)"]?.keys[itemKeyIndex])!
        
        // Updates GUI so it's changing as we are transitioning
        controller.updateGUI()
        
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        let controller = presentingViewController as! ViewController
        return controller.AnimalsPlants.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let controller = presentingViewController as! ViewController
        
        // Returns the numbers of rows depending on the component
        if component == categoryComponent {
            return controller.AnimalsPlants.count
        } else {
            return controller.AnimalsPlants[controller.currentSelectedCategory]!.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        // Gets information we need from the inital scene controller
        let controller = presentingViewController as! ViewController
        // This just helps the code look a little prettier in this function
        let AnimalsPlants = controller.AnimalsPlants
        
        // Creates the UI Label and sets the background color
        let compenantLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 32))
        compenantLabel.backgroundColor = UIColor.clear
        
        // Now to figure out what the label says we need to figure out which component we are dealing with
        if component == categoryComponent {
            // Next we need to change the row Int into a index that we can use to get the key for the text
            let categoryKeyIndex = AnimalsPlants.index(AnimalsPlants.startIndex, offsetBy: row)
            
            // Sets the label text
            compenantLabel.text = controller.AnimalsPlants.keys[categoryKeyIndex]
        } else {
            // Next we need to change the row Int into a index that we can use to get the key for the text
            let itemKeyIndex = AnimalsPlants["\(controller.currentSelectedCategory)"]!.index(AnimalsPlants["\(controller.currentSelectedCategory)"]!.startIndex, offsetBy: row)

            // Sets the label text
            compenantLabel.text = controller.AnimalsPlants["\(controller.currentSelectedCategory)"]?.keys[itemKeyIndex]

        }
        // Returns the label that we created
        return compenantLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 55.0
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 112
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let controller = presentingViewController as! ViewController
        
        // Next we need to change the selected row int into a index that we can use to get the key for the text
        let categoryKeyIndex = controller.AnimalsPlants.index(controller.AnimalsPlants.startIndex, offsetBy: plantAnimalChooser.selectedRow(inComponent: categoryComponent))
        
        // Sets the currently selected category
        controller.currentSelectedCategory = controller.AnimalsPlants.keys[categoryKeyIndex]
        
        // Reloads the item component
        plantAnimalChooser.reloadComponent(itemComponent)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let controller = presentingViewController as! ViewController
        
        // Gets all the categories
        let categoryKeys = controller.AnimalsPlants.keys
        
        // Gets an Int from the dictionary that we can use to pic the currently selected item
        let categorySelectedRow = categoryKeys.distance(from: categoryKeys.startIndex, to: categoryKeys.firstIndex(of: controller.currentSelectedCategory)!)
        
        // Sets the currently selected item
        plantAnimalChooser.selectRow(categorySelectedRow, inComponent: categoryComponent, animated: false)
        
        // Gets all the items
        let itemKeys = controller.AnimalsPlants["\(controller.currentSelectedCategory)"]?.keys
        
        // Gets an Int from the dictionary that we can use to pic the currently selected item
        let itemSelectedRow = itemKeys!.distance(from: itemKeys!.startIndex, to: itemKeys!.firstIndex(of: controller.currentSelectedItem)!)
        
        // Sets the currently selected item
        plantAnimalChooser.selectRow(itemSelectedRow, inComponent: itemComponent, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
