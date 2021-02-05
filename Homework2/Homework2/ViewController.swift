//
//  ViewController.swift
//  Homework2
//  CSC308
//  Created by Caleb Chapman on 2/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    var currentLocation = "Lexington"
    var currentAttraction = "Keenland"
    
    // UI Elements
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var attractionImageView: UIImageView!
    @IBOutlet weak var attractionSelector: UISegmentedControl!
    
    // Action for location selector
    @IBAction func locationSelector(_ sender: UISegmentedControl) {
        // Setting the currently selected location based upon what is selected.
        currentLocation = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        
        // Configuring the second segments depending on the selected location
        attractionSelector.removeAllSegments()
        switch currentLocation {
        case "Lexington":
            attractionSelector.insertSegment(withTitle: "Keenland", at: 0, animated: false)
            attractionSelector.insertSegment(withTitle: "Arboretum", at: 1, animated: false)
        case "Chengdu":
            attractionSelector.insertSegment(withTitle: "Panda", at: 0, animated: false)
            attractionSelector.insertSegment(withTitle: "Pedestrian Street", at: 1, animated: false)
        case "Chicago":
            attractionSelector.insertSegment(withTitle: "Millenium Park", at: 0, animated: false)
            attractionSelector.insertSegment(withTitle: "Skydeck", at: 1, animated: false)
            attractionSelector.insertSegment(withTitle: "Cruise", at: 2, animated: false)
            attractionSelector.insertSegment(withTitle: "Planetarium", at: 3, animated: false)
        default:
            attractionSelector.insertSegment(withTitle: "Disneyland", at: 0, animated: false)
            attractionSelector.insertSegment(withTitle: "Ocean Park", at: 1, animated: false)
            attractionSelector.insertSegment(withTitle: "The Peak", at: 2, animated: false)
        }
        
        // Setting currently selected attraction
        attractionSelector.selectedSegmentIndex = 0
        currentAttraction = attractionSelector.titleForSegment(at: attractionSelector.selectedSegmentIndex)!
            
        // Updating label and image
        selectionChanged()
    }
    
    // Action for the attraction selector
    @IBAction func attractionSelector(_ sender: UISegmentedControl) {
        // Updating the current attraction based upon the attraction selected
        currentAttraction = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        
        // Updating the label and image
        selectionChanged()
    }
    
    // Function that updates the UI based on the currently selected location and attraction
    func selectionChanged() {
        
        // Rewriting the label according to the selected
        outputLabel.text = "\(currentLocation): \(currentAttraction)"
        // Sets image to currently selected attractoin
        attractionImageView.image = UIImage(named: "\(currentAttraction).jpg")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

