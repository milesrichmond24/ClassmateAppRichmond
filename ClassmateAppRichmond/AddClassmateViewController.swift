//
//  AddClassmateViewController.swift
//  ClassmateAppRichmond
//
//  Created by MILES RICHMOND on 10/13/23.
//

import UIKit

class AddClassmateViewController: UIViewController {

    
    weak var delegate1: InfoViewController!
    weak var delegate2: InfoTableViewController!
    
    var classmates: [Classmate]!
    
    
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
        
        if delegate1 == nil {
            delegate2.classmates.append(Classmate(name: name!, age: age, uID: uID))
            delegate2.tableView.reloadData()
        } else {
            delegate1.classmates.append(Classmate(name: name!, age: age, uID: uID))
        }
        
        clearInput()
    }
    
    @IBAction func remove_action(_ sender: UIButton) {
        let name = name_field.text
        var age: Int = 0
        var uID: Int = 0
        
        if let ageTemp = Int(age_field.text!) {
            age = ageTemp
        } else {
            response_label.text = "Remove Failed (Invalid Age)"
            return
        }
        
        if let uIDTemp = Int(uID_field.text!) {
            uID = uIDTemp
        } else {
            response_label.text = "Remove Failed (Invalid uID)"
            return
        }
        
        var indexToRemove: Int = -1
        
        // Search array
        for i in 0...classmates.count {
            let target = classmates[i]
            if(target.name != name || target.age != age || target.uID != uID) {
                continue
            }
            
            indexToRemove = i
            break
        }
        
        if(indexToRemove == -1) {
            response_label.text = "Remove Faild (Student does not exist)"
            return
        }
        
        response_label.text = "Remove Successful"
        
        if delegate1 == nil {
            delegate2.classmates.remove(at: indexToRemove)
            delegate2.tableView.reloadData()
        } else {
            delegate1.classmates.remove(at: indexToRemove)
        }
        
        clearInput()
    }
    
    func clearInput() {
        name_field.text = ""
        age_field.text = ""
        uID_field.text = ""
    }
}
