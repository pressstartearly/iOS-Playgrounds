//
//  CategoryViewController.swift
//  homework6
//
//  Created by Caleb Chapman on 3/18/21.
//  CSC308

import UIKit

class CategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        // gets view controller for the sending view
        let controller = presentingViewController as! ViewController
        
        // Sets category as the buttons title
        controller.currentCategory = sender.currentTitle!
        
        // Reloads images
        controller.loadImages()
        
        // Closes category select view
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
