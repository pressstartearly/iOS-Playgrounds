//
//  ViewController.swift
//  MIdterm
//
//  Created by Caleb Chapman on 3/11/21.
//  CSC308

import UIKit

class ViewController: UIViewController {
    
    // For simplicity I just made a 2d dictionary of all the values we are going to need.
    var categoriesAndClasses = [
        "Math Related": [
            "CSC185": 2,
            "CSC195": 4
        ],
        "Programming": [
            "CSC190": 3,
            "CSC191": 3,
            "CSC308": 2
            
        ],
        "Others": [
            "CSC310": 3,
            "CSC313": 2,
            "CSC340": 3
        ]
    ]
    
    // We use this to keep track of the current slide that we are on
    var currentSlide = 0
    
    // Outlets
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet var challangeLevel: [UIImageView]!
    @IBOutlet weak var exampleSlide: UIImageView!
    @IBOutlet weak var category: UISegmentedControl!
    
    // This actions is for the category segmented conroll
    @IBAction func onCategoryChange(_ sender: UISegmentedControl) {
        
        // Here we are going to get the current category that is selected
        let currentCat = category.titleForSegment(at: category.selectedSegmentIndex)!
        // Then we are going to get the first element from that category
        let course = categoriesAndClasses["\(currentCat)"]?.first
        // We have to set this back to zero so we know where in the list we are
        currentSlide = 0
        // Then as long as there wasn't an error, we are going to update the GUI with the correct course
        if (course != nil) {
            updateGUI(courseName: String(course?.key ?? ""), difficulty: Int(course?.value ?? 0))
        }
    }
    
    // This action handles the next button press
    @IBAction func onNext(_ sender: UIButton) {
        // First we need to get the current category
        let currentCat = category.titleForSegment(at: category.selectedSegmentIndex)!
        // Then we are going to get the courses for that category
        let courses = categoriesAndClasses["\(currentCat)"]
        
        // Next we need to check if we are at the end of the list. If so we are going to wrap back around
        if currentSlide < courses!.count-1  {
            // Add one to the current slide tracker
            currentSlide += 1
            // Then we have to get the index for the next slide
            let courseKeyIndex = courses!.index(courses!.startIndex, offsetBy: currentSlide)
            // Then we update the GUI with the new slide information
            updateGUI(courseName: (courses?.keys[courseKeyIndex])!, difficulty: (courses?.values[courseKeyIndex])!)
        } else {
            // If we have wrapped around we need to set our tracker back to zero
            currentSlide = 0
            // Then we get the index for the next slide
            let courseKeyIndex = courses!.index(courses!.startIndex, offsetBy: currentSlide)
            // And update the GUI
            updateGUI(courseName: (courses?.keys[courseKeyIndex])!, difficulty: (courses?.values[courseKeyIndex])!)
        }
        
    }
    
    // This action handles the previous button press. This is very similar to the next button action
    @IBAction func onPrevious(_ sender: UIButton) {
        // Once again we get the current category
        let currentCat = category.titleForSegment(at: category.selectedSegmentIndex)!
        // and a list of courses for that category
        let courses = categoriesAndClasses["\(currentCat)"]
        // Next if we aren't back to the beginning of the list we will go back. If we are at the beginning we loop back around.
        if currentSlide > 0  {
            // set our current slide tracker back one
            currentSlide = currentSlide-1
            // get the index for the previous slide
            let courseKeyIndex = courses!.index(courses!.startIndex, offsetBy: currentSlide)
            // and update the gui
            updateGUI(courseName: (courses?.keys[courseKeyIndex])!, difficulty: (courses?.values[courseKeyIndex])!)
        } else {
            // if we have wrapped all the way around, we are going to set the current slide tracker to the count of objects in the dictionary, minus one
            currentSlide = courses!.count-1
            // then get the index for the slide
            let courseKeyIndex = courses!.index(courses!.startIndex, offsetBy: currentSlide)
            // and update the GUI
            updateGUI(courseName: (courses?.keys[courseKeyIndex])!, difficulty: (courses?.values[courseKeyIndex])!)
        }
    }
    
    // A single function that can be called that will update the GUI based on the course that needs to be displayed
    func updateGUI(courseName: String, difficulty: Int) {
        // Updates the label to the current course name
        classLabel.text = courseName
        // calls the update difficulty function to update the graduation caps
        updateDifficulty(difficulty: difficulty)
        // sets the example slide image to the correct one for the course
        exampleSlide.image = UIImage(named: courseName)
    }
    
    // This function calculates and displays the number of graduation caps that are needed to display the course difficulty
    func updateDifficulty(difficulty: Int) {
        // gets the number of graduation caps needed
        var capsNeeded = difficulty;
        // We are goign to loop through all the images in the outlet group
        for icon in challangeLevel {
            // if we still need to display more caps then we are going to set the image to the filled in graduation cap
            if capsNeeded > 0 {
                icon.image = UIImage(named: "graduation-cap")
                // We are then going to subtract one from the number of caps needed
                capsNeeded = capsNeeded-1
            } else {
                // If we don't need to display anymore caps, we are going to set it to just the outline of a graduation cap
                icon.image = UIImage(named: "graduation-cap-light")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

