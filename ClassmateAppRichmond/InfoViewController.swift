//
//  InfoViewController.swift
//  ClassmateAppRichmond
//
//  Created by MILES RICHMOND on 10/11/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    var delegate: ViewController!
    var delegate2: InfoTableViewController!
    
    var classmates: [Classmate] = []
    var targetIndex: Int = 0

    @IBOutlet weak var uID_label: UILabel!
    @IBOutlet weak var age_label: UILabel!
    @IBOutlet weak var name_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayClassmateInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if(delegate != nil) {
            delegate.classmates = classmates
        } else {
            delegate2.classmates = classmates
        }
        

    }
    
    func displayClassmateInfo() {
        let name: String = classmates[targetIndex].name
        let age: Int = classmates[targetIndex].age
        let uID: Int = classmates[targetIndex].uID
        
        name_label.text = name
        age_label.text = String(age)
        uID_label.text = String(uID)
    }
    
    
    @IBAction func previous_action(_ sender: UIButton) {
        if(targetIndex == 0) {
            targetIndex = classmates.count - 1
        } else {
            targetIndex -= 1
        }
        
        displayClassmateInfo()
    }
    
    @IBAction func sort_action(_ sender: UIButton) {
        classmates = classmates.sorted(by: { $0.age < $1.age })
        targetIndex = 0
        displayClassmateInfo()
    }
    
    @IBAction func add_action(_ sender: UIButton) {
        performSegue(withIdentifier: "add", sender: self)
    }
    
    @IBAction func next_action(_ sender: UIButton) {
        if(targetIndex == classmates.count - 1) {
            targetIndex = 0
        } else {
            targetIndex += 1
        }
        
        displayClassmateInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! AddClassmateViewController
        nextViewController.delegate1 = self
        nextViewController.classmates = self.classmates
    }
}
