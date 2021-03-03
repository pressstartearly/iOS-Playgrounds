//
//  ViewController.swift
//  Homework5
//
//  Created by user185565 on 3/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scratchButton: [UIButton]!
    
    @IBAction func doScratchOff(_ sender: UIButton) {
        let button = scratchButton.first(where: { $0.currentTitle == sender.currentTitle})
        button?.setImage(nil, for: UIControl.State.normal)
    }
    
    @IBAction func howTo(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
            

}

