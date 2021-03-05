//
//  ViewController.swift
//  Homework5
//
//  Created by Caleb Chapman on 3/3/21.
//  CSC308

import UIKit

class ViewController: UIViewController {
    
    // Outlest
    @IBOutlet var scratchButton: [UIButton]!
    @IBOutlet weak var winningsLabel: UILabel!
    
    
    // custom variables
    var lastNumber = 0
    var cashMoney = 0
    var totalClicks = 0
    
    // Gets a random number between 0,9 that isn't the last number
    func getRandomNumber() -> Int {
        var randomNum = Int(arc4random()) % 10
        while randomNum == lastNumber {
            randomNum = Int(arc4random()) % 10
        }
        lastNumber = randomNum
        return randomNum
    }
    
    // Resets the game back to it's original state
    func resetGame() {
        var i = 1
        for button in scratchButton {
            
            // Enables all the buttons
            button.isEnabled = true;
           
            // Sets each title to a unique number so that our logic for identifying which button is pressed works
            button.setTitle(String(i), for: UIControl.State.normal)
            
            // Sets image back to dollar sign
            button.setImage(UIImage(named: "money"), for: UIControl.State.normal)
            i += 1
        }
        
        // resets variables
        totalClicks = 0
        cashMoney = 0
        
        // sets label back to default
        winningsLabel.text = "Total Winnings: $\(cashMoney)"
    }
    
    // One single function for all the buttons presses
    @IBAction func doScratchOff(_ sender: UIButton) {
        
        // First we have to get the outlet for the button that is pressed. We do this by finding the button in the collection where the titles equal.
        let button = scratchButton.first(where: { $0.currentTitle == sender.currentTitle})
        
        // Gets the money that the button will give the player
        let money = getRandomNumber()*100
        
        // Removes image
        button?.setImage(nil, for: UIControl.State.normal)
        
        // Sets the title to the amount of money the player won
        button?.setTitle(String(money), for: UIControl.State.normal)
        
        // Disables the button so it can't be pressed again
        button?.isEnabled = false
        
        // Added the money and a click to the variable
        cashMoney += money
        totalClicks += 1
        
        // Updates the label to show the current winnings
        winningsLabel.text = "Total Winnings: $\(cashMoney)"
        
        // If the user has clicked two buttons the game is over. We then need to give the player some options
        if totalClicks == 2 {
            let alertController = UIAlertController(title: "Lucky You!", message: "You won $\(cashMoney) cash money!", preferredStyle: UIAlertController.Style.alert)
            
            // Allows user to choose to exit the application
            let exitAction = UIAlertAction(title: "Exit", style: UIAlertAction.Style.destructive, handler: {(alertAction: UIAlertAction) in exit(0)})
            
            // Allows the user to reset the game and play again
            let playAgainAction = UIAlertAction(title: "Play Again!", style: UIAlertAction.Style.default, handler: {(alertAction: UIAlertAction) in self.resetGame()})
            
            alertController.addAction(exitAction)
            alertController.addAction(playAgainAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    // The how to button explains how to the play the game via an alert.
    @IBAction func howTo(_ sender: UIButton) {
        let alertController = UIAlertController(title: "How To Play", message: "Click a dollar sign to get that cash money! You only get two chances to pick a lucky one!", preferredStyle: UIAlertController.Style.alert)
        
        // Allows the user to say okay to return to the application
        let defaultAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

