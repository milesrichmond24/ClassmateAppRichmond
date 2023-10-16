//
//  QuizViewController.swift
//  ClassmateAppRichmond
//
//  Created by MILES RICHMOND on 10/11/23.
//

import UIKit

class QuizViewController: UIViewController {

    var delegate: ViewController!
    var classmates: [Classmate] = []
    
    @IBOutlet weak var uID_label: UILabel!
    @IBOutlet weak var age_label: UILabel!
    @IBOutlet weak var name_label: UILabel!
    
    @IBOutlet weak var answer_image: UIImageView!
    @IBOutlet weak var userAnswer_field: UITextField!
    
    var missingInfo: infoType = infoType.age
    var targetClassmate: (name: String, age: Int, uID: Int)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayClassmateInfo()
    }
    
    func selectInfo() -> (name: String, age: Int, uID: Int) {
        let target = classmates.randomElement()
        if target != nil {
            let name: String = target!.name
            let age: Int = target!.age
            let uID: Int = target!.uID
            
            return (name, age, uID)
        }
        
        return ("ERROR", 0, 0)
    }
    
    func displayClassmateInfo() {
        targetClassmate = selectInfo()
        let missingIndex = Int.random(in: 0...2)
        
        // Name required
        if(missingIndex == 0) {
            name_label.text = "[Name?]"
            age_label.text = "Age: \(targetClassmate.age)"
            uID_label.text = "uID: \(targetClassmate.uID)"
            
        // Age required
        } else if(missingIndex == 1) {
            name_label.text = "Name: \(targetClassmate.name)"
            age_label.text = "[Age?]"
            uID_label.text = "uID: \(targetClassmate.uID)"
            
        // uID required
        } else if(missingIndex == 2) {
            name_label.text = "Name: \(targetClassmate.name)"
            age_label.text = "Age: \(targetClassmate.age)"
            uID_label.text = "[uID?]"
        } else {
            name_label.text = "[Name]"
            age_label.text = "[Age]"
            uID_label.text = "[uID?]"
            
            print("don't know what happen")
        }
        
        
    }
    

    @IBAction func answerCheck_action(_ sender: UIButton) {
        let guess = userAnswer_field.text
        var correct: Bool = false
        
        switch missingInfo {
        case .name:
            if(guess == targetClassmate.name) {
                correct = true
            }
        case .age:
            if(Int(guess!) == targetClassmate.age) {
                correct = true
            }
        case .uID:
            if(Int(guess!) == targetClassmate.uID) {
                correct = true
            }
        }
        
        if(correct) {
            answer_image.image = UIImage(named: "correct")
        } else {
            answer_image.image = UIImage(named: "incorrect")
        }
        
        displayClassmateInfo()
    }
}

enum infoType {
    case name
    case age
    case uID
}
