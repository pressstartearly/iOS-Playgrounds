//
//  ViewController.swift
//  homework6
//
//  Created by Caleb Chapman on 3/18/21.
//

import UIKit

class ViewController: UIViewController {
    
    // This array holds all the images for each category
    var allImages = [
        "Food": [
            UIImage(named: "food1"),
            UIImage(named: "food2"),
            UIImage(named: "food3"),
            UIImage(named: "food4"),
        ],
        "Flowers": [
            UIImage(named: "flower1"),
            UIImage(named: "flower2"),
            UIImage(named: "flower3"),
            UIImage(named: "flower4"),
            UIImage(named: "flower5"),
        ],
        "Vehicles": [
            UIImage(named: "vehicle1"),
            UIImage(named: "vehicle2"),
            UIImage(named: "vehicle3"),
            UIImage(named: "vehicle4"),
            UIImage(named: "vehicle5"),
            UIImage(named: "vehicle6"),
        ]
    ]
    
    // the currently selected category
    var currentCategory = "Food"
    
    // Outlets
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet var imageChoiceCollection: [UIButton]!
    
    // The refresh button just calls the loadImages function
    @IBAction func refreshImages(_ sender: UIButton) {
        loadImages()
    }
    
    // Checks to see if the selected item is a match. Then displays popups accordingly
    @IBAction func imageSelected(_ sender: UIButton) {
        
        // Automatically assume a failure
        var alertController = UIAlertController(title: "Test Failed!", message: "You must be a robot!", preferredStyle: UIAlertController.Style.alert)
        
        // changes the alertController to test passed if it was correct
        if allImages["\(currentCategory)"]!.contains(sender.currentBackgroundImage!) {
            alertController = UIAlertController(title: "Test Passed!", message: "You are not a robot!", preferredStyle: UIAlertController.Style.alert)
        }
        
        // Displays the popup
        let defaultAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: {(alertAction: UIAlertAction) in self.loadImages()})
        
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // This function will load all the images at random. This was created as a  function because this code will need to be run in a lot of different scenarios
    func loadImages() {
        // Sets the main image as something random from the current category
        mainImage.image = (allImages["\(currentCategory)"]?.randomElement())!
        
        // Next we are going to shuffle the buttons in the image choice collection so we can "randomly" select the first button
        imageChoiceCollection.shuffle()
        
        // This picks a random image but also checks to make sure it's not identical to the current image being displayed
        var randomImage = mainImage.image
        while randomImage == mainImage.image {
            randomImage = (allImages["\(currentCategory)"]?.randomElement())!
        }
        
        // The "first" button in the collection will now be shuffled and could be different or the same as last time. We then set a random image from the current category
        imageChoiceCollection.first?.setBackgroundImage(randomImage, for: UIControl.State.normal)
        
        // Now we need to pick a random category that is not the current category to pick from for the wrong image
        var randomCategory = currentCategory
        while randomCategory == currentCategory {
            randomCategory = allImages.randomElement()!.key
        }
        
        // Sets the "last" button in the collection, which has been shuffled to a random image in the random category that was just selected
        imageChoiceCollection.last?.setBackgroundImage((allImages["\(randomCategory)"]?.randomElement())!, for: UIControl.State.normal)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // onload we will select a random category
        currentCategory = allImages.randomElement()!.key
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // loads images
        loadImages()
    }


}

