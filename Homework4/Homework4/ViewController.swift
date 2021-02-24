//
//  ViewController.swift
//  Homework4
//
//  Created by Caleb Chapman on 2/24/21.
//  CSC308

import UIKit

class ViewController: UIViewController {
    
    // Custom Variables
    var play = false
    
    // Outlets
    @IBOutlet weak var fpsLabel: UILabel!
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var satImage: UIImageView!
    @IBOutlet weak var satType: UISegmentedControl!
    @IBOutlet weak var playStopButton: UIButton!
    
    // Actions
    @IBAction func changeSpeedStepper(_ sender: UIStepper) {
        
        // update the animation duraction based on the steppper
        satImage.animationDuration = speedStepper.value
        
        // update the FPS label
        fpsLabel.text = "14 frames in \(speedStepper.value) seconds"
        
        // If we are still playing, start animation again
        if play {
            satImage.startAnimating()
        }
    }
    
    @IBAction func changeType(_ sender: UISegmentedControl) {
        // When we change the type, recall the getImages function to get the new list of images
        satImage.animationImages = getImages()
        // If we are still playing, start animation again. If we aren't animating, go ahead and reset the static image to the first image in the image array
        if play {
            satImage.startAnimating()
        } else {
            satImage.image = getImages()[0]
        }
    }
    
    @IBAction func playStop(_ sender: UIButton) {
        // Change the status of play to opposite of what it currently is
        play = !play
        // Set the animation and title of button depending on what the current value of the play status boolean
        if play {
            playStopButton.setTitle("Stop", for: UIControl.State.normal)
            satImage.startAnimating()
        } else {
            playStopButton.setTitle("Play", for: UIControl.State.normal)
            satImage.stopAnimating()
        }
    }
    
    // Returns array of images depending if visable or infrared is selected
    func getImages() -> Array<UIImage> {
        var images: Array<UIImage> = Array()
        for i in (1...14) {
            let image = String(format: "\(satType.titleForSegment(at: satType.selectedSegmentIndex)!.lowercased())%02d.jpg", i)
            images.append(UIImage(named: image)!)
        }
        return images
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set label after loading
        fpsLabel.text = "14 frames in \(speedStepper.value) seconds"
        
        // Get the images to animate based on what selection is loaded. I moved this here so that we don't have to call it every time we press play/stop. Since it's also loaded when the type is changed it was just going to be an extra unneccessary call after starting the app up for the first time.
        satImage.animationImages = getImages()
    }


}

