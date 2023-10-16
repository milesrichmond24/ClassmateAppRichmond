//
//  AddClassmateViewController.swift
//  ClassmateAppRichmond
//
//  Created by MILES RICHMOND on 10/13/23.
//

import UIKit

class AddClassmateViewController: UIViewController {

    
    weak var delegate: InfoViewController!
    
    
    @IBOutlet weak var response_label: UILabel!
    @IBOutlet weak var name_field: UITextField!
    @IBOutlet weak var age_field: UITextField!
    @IBOutlet weak var uID_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func add_action(_ sender: UIButton) {
        let name = name_field.text
        var age: Int = 0
        var uID: Int = 0
        
        if let ageTemp = Int(age_field.text!) {
            age = ageTemp
        } else {
            response_label.text = "Add Failed (Invalid Age)"
            
            return
        }
        
        if let uIDTemp = Int(uID_field.text!) {
            uID = uIDTemp
        } else {
            response_label.text = "Add Failed (Invalid uID)"
            
            return
        }
        
        response_label.text = "Add Successful"
        
        delegate.classmates.append(Classmate(name: name!, age: age, uID: uID))
        clearInput()
    }
    
    func clearInput() {
        name_field.text = ""
        age_field.text = ""
        uID_field.text = ""
    }
}
