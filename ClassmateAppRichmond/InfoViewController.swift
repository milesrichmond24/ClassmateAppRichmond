//
//  InfoViewController.swift
//  ClassmateAppRichmond
//
//  Created by MILES RICHMOND on 10/11/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    weak var delegate: ViewController?
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
        nextViewController.delegate = self
    }
}
