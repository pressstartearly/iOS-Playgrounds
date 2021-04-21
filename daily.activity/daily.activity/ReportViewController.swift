//
//  ReportViewController.swift
//  daily.activity
//
//  Created by Caleb Chapman on 4/14/21.
//

import UIKit

class ReportViewController: UIViewController {

    // Outlets for the GUI objects
    @IBOutlet weak var bmrLabel: UILabel!
    @IBOutlet weak var totalCaloriesLabel: UILabel!
    @IBOutlet weak var itemizedCaloriesBurned: UILabel!
    @IBOutlet weak var itemizedActivity: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        // Getting the controllers for the other tab views so we can access their data
        let settingsController = ((parent as! ActivityTrackerTabBarController).viewControllers![2] as! SettingsViewController)
        let logController = ((parent as! ActivityTrackerTabBarController).viewControllers![1] as! LogViewController)
        
        // variables need for reading in the data from the log
        var totalCal = 0.0
        var activitiesPerformed = Array<Activity>()
        
        // Goes through the logs and calculates the total calories burned, and then gets the activities that have been performed and puts the in an array we can loop through later for the gui
        for category in logController.activities {
            for activity in category.value {
                if activity.hours > 0 {
                    totalCal += (activity.hours * Double(activity.caloriesPerHour))
                    activitiesPerformed.append(activity)
                }
            }
        }
        
        // Updates the GUI for the total cals burned
        totalCaloriesLabel.text = String(format: "%.02f", (totalCal))
        
        // We first need to clear the label out so we don't get duplicates
        itemizedActivity.text = ""
        itemizedCaloriesBurned.text = ""
        
        // Now we loop through the activities performed and add them to their labels
        for activity in activitiesPerformed {
            itemizedActivity.text = itemizedActivity.text! + activity.name + "\n"
            itemizedCaloriesBurned.text = itemizedCaloriesBurned.text! + String(format: "%.02f\n", (activity.hours * Double(activity.caloriesPerHour)))
        }
        
        // Now resize the label to fit the text
        itemizedCaloriesBurned.sizeToFit()
        itemizedActivity.sizeToFit()
        
        // Gets the height and weight from the settings
        var height = settingsController.settings.height
        var weight = settingsController.settings.weight
        var age = settingsController.settings.age
        
        // If it's not set to metric convert the height and weight
        if(!settingsController.settings.metric) {
            weight = weight / 2.2046
            height = height / 0.39370
        }
        
        // Depending on the users sex we do the BMR calculations and edit the the label text
        if(settingsController.settings.male) {
            let bmr = (10.0 * weight + 6.25 * height - 5.0 * Double(age) + 5.0)
            bmrLabel.text = String(format: "%.02f", bmr)
        } else {
            let bmr = (10.0 * weight + 6.25 * height - 5.0 * Double(age) - 161.0)
            bmrLabel.text = String(format: "%.02f", bmr)
        }
    }

}
