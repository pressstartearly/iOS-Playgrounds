//
//  ViewController.swift
//  Homework7
//
//  Created by Caleb Chapman on 4/1/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    // List of categories, items, and their respective URLs
    let AnimalsPlants = [
        "Plants": [
            "Dandelion": "https://en.wikipedia.org/wiki/Taraxacum",
            "Beargrass": "https://en.wikipedia.org/wiki/Xerophyllum_tenax",
            "Hibiscus": "https://en.wikipedia.org/wiki/Hibiscus",
        ],
        "Animals": [
            "Panda": "https://en.wikipedia.org/wiki/Panda",
            "Elephant": "https://en.wikipedia.org/wiki/Panda",
            "Lion": "https://en.wikipedia.org/wiki/Lion",
            "Penguin": "https://en.wikipedia.org/wiki/Penguin",
            "Wolf": "https://en.wikipedia.org/wiki/Wolf",
            "Bear": "https://en.wikipedia.org/wiki/Bear",
        ],
    ]
    
    // Vars to store values that we will need to remember for the models
    var rgb = [0,0,0]
    var hex = [0,0,0,0,0,0]
    
    // Vars to be used to store what is currently selected by the user
    var currentSelectedItem = "Dandelion"
    var currentSelectedCategory = "Plants"

    // Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var choosePlantAnimal: UIBarButtonItem!
    @IBOutlet weak var wikiView: WKWebView!
    @IBOutlet var itemLabel: UILabel!
    
    // For both buttons that open a new scene
    @IBAction func showNewScene(_ sender: AnyObject) {
        if sender === choosePlantAnimal {
            performSegue(withIdentifier: "toAnimalPlantChooser", sender: sender)
        } else {
            performSegue(withIdentifier: "toTextColorChooser", sender: sender)
        }
    }
    
    // updates all the GUI objects
    func updateGUI() {
        // Loads the new URL from the array
        wikiView.load(URLRequest(url: URL(string: AnimalsPlants[currentSelectedCategory]![currentSelectedItem]!)!))
        
        // Updates the background image using the name of the currently selected item
        backgroundImage.image = UIImage(named: currentSelectedItem)
        
        // Sets the label from the currently selected item
        itemLabel.text = currentSelectedItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateGUI()
    }


}

