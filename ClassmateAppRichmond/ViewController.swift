//
//  ViewController.swift
//  ClassmateAppRichmond
//
//  Created by MILES RICHMOND on 10/11/23.
//

import UIKit

class ViewController: UIViewController {
    var classmates: [Classmate]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        classmates.append(Classmate(name: "Beef", age: 17, uID: 3992))
        classmates.append(Classmate(name: "Pork", age: 18, uID: 2674))
        
                          
        
    }


}

