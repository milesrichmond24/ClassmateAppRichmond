//
//  ViewController.swift
//  ClassmateAppRichmond
//
//  Created by MILES RICHMOND on 10/11/23.
//

import UIKit

class ViewController: UIViewController {
    var classmates: [Classmate] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        classmates.append(Classmate(name: "Beef", age: 17, uID: 3992))
        classmates.append(Classmate(name: "Pork", age: 18, uID: 2674))
        
        print(classmates[0].name)
        
                          
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        switch segue.identifier {
        case "toInfo":
            let nextViewController = segue.destination as! InfoViewController
            nextViewController.delegate = self
            nextViewController.classmates = self.classmates
        case "toQuiz":
            let nextViewController = segue.destination as! QuizViewController
            nextViewController.delegate = self
            nextViewController.classmates = self.classmates
        default:
            return;
        }
        
        
    }

    @IBAction func moveToQuiz_action(_ sender: UIButton) {
        performSegue(withIdentifier: "toQuiz", sender: self)
    }
    
    @IBAction func moveToInfo_action(_ sender: UIButton) {
        performSegue(withIdentifier: "toInfo", sender: self)
    }
}
