//
//  LogViewController.swift
//  daily.activity
//
//  Created by Caleb Chapman on 4/14/21.
//

import UIKit

struct Activity {
    var name = ""
    var hours = 0.0
    var caloriesPerHour = 0
}

class LogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let categories = ["Conditioning Exercise", "Dancing", "Running", "Sports"]
    
    var activities = [
        "Conditioning Exercise": [
            Activity(name: "Bicycling", caloriesPerHour: 398),
            Activity(name: "Rope Skipping", caloriesPerHour: 699),
            Activity(name: "Pilates", caloriesPerHour: 170),
            Activity(name: "Yoga", caloriesPerHour: 227)
        ],
        "Dancing": [
            Activity(name: "Ballet", caloriesPerHour: 284),
            Activity(name: "Ballroom Dancing", caloriesPerHour: 443)
        ],
        "Running": [
            Activity(name: "Marathon", caloriesPerHour: 755),
            Activity(name: "Jogging", caloriesPerHour: 398)
        ],
        "Sports": [
            Activity(name: "Badminton", caloriesPerHour: 312),
            Activity(name: "Basketball", caloriesPerHour: 369),
            Activity(name: "Bowling", caloriesPerHour: 170),
            Activity(name: "Boxing", caloriesPerHour: 312),
            Activity(name: "Fencing", caloriesPerHour: 341)
        ]
    ]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities[categories[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell")
    
        cell!.textLabel!.text = activities[categories[indexPath.section]]![indexPath.row].name
        cell!.detailTextLabel!.text = "\(activities[categories[indexPath.section]]![indexPath.row].hours)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Activity Duration", message: "How many hours did you exercise?", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "0"
            textField.keyboardType = UIKeyboardType.decimalPad
        }
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { [self] (alertAction: UIAlertAction!) in
            
            // We do want to set this a 0.0 if it is nil
            activities[self.categories[indexPath.section]]![indexPath.row].hours = Double(alertController.textFields![0].text!) ?? 0.0
            
            activityTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
    }

    @IBOutlet weak var activityTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
