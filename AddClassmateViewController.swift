//
//  AddClassmateViewController.swift
//  ClassmateAppRichmond
//
//  Created by MILES RICHMOND on 10/13/23.
//

import UIKit

class AddClassmateViewController: UIViewController {

    
    weak var delegate: InfoViewController!
    
    
    @IBOutlet weak var name_field: UITextField!
    @IBOutlet weak var age_field: UITextField!
    @IBOutlet weak var uID_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func add_action(_ sender: UIButton) {
        let name = name_field.text
        var age:Int
        var uID: Int
        
        if age = Int(age_field.text) {
            
        } else {
            age = 0
        }
        
        delegate.classmates.append(Classmate(name: name, age: age, uID: uID))
    }
    
    func clearInput() {
        name_label.text = ""
        age_label.text = ""
        uID_label.text = ""
    }
}
