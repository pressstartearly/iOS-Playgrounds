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
            
        }
    }
    
    @IBAction func howTo(_ sender: UIButton) {
        let alertController = UIAlertController(title:"How To Play", message "Click a", UIAlertAction.Style.alert)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
            

}

