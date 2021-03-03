//
//  ViewController.swift
//  Homework5
//
//  Created by user185565 on 3/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scratchButton: [UIButton]!
    @IBOutlet weak var winningsLabel: UILabel!
    
    var lastNumber = 0
    var cashMoney = 0
    var totalClicks = 0
    
    func getRandomNumber() -> Int {
        var randomNum = Int(arc4random()) % 10
        while randomNum == lastNumber {
            randomNum = Int(arc4random()) % 10
        }
        lastNumber = randomNum
        return randomNum
    }
    
    func resetGame() {
        var i = 1
        for button in scratchButton {
            button.isEnabled = true;
            button.setTitle(String(i), for: UIControl.State.normal)
            button.setImage(UIImage(named: "money"), for: UIControl.State.normal)
            i += 1
        }
        totalClicks = 0
        cashMoney = 0
        winningsLabel.text = "Total Winnings: $\(cashMoney)"
    }
    
    @IBAction func doScratchOff(_ sender: UIButton) {
        let button = scratchButton.first(where: { $0.currentTitle == sender.currentTitle})
        let money = getRandomNumber()*100
        
        button?.setImage(nil, for: UIControl.State.normal)
        button?.setTitle(String(money), for: UIControl.State.normal)
        button?.isEnabled = false
        cashMoney += money
        totalClicks += 1
        winningsLabel.text = "Total Winnings: $\(cashMoney)"
        
        if totalClicks == 2 {
            let alertController = UIAlertController(title: "Lucky You!", message: "You won $\(cashMoney) cash money!", preferredStyle: UIAlertController.Style.alert)
            
            let exitAction = UIAlertAction(title: "Exit", style: UIAlertAction.Style.destructive, handler: {(alertAction: UIAlertAction) in exit(0)})
            
            let playAgainAction = UIAlertAction(title: "Play Again!", style: UIAlertAction.Style.default, handler: {(alertAction: UIAlertAction) in self.resetGame()})
            
            alertController.addAction(exitAction)
            alertController.addAction(playAgainAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func howTo(_ sender: UIButton) {
        let alertController = UIAlertController(title: "How To Play", message: "Click a dollar sign to get that cash money! You only get two chances to pick a lucky one!", preferredStyle: UIAlertController.Style.alert)
        
        let defaultAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
            

}

