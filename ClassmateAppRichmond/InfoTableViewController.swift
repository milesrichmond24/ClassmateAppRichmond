//
//  InfoTableViewController.swift
//  ClassmateAppRichmond
//
//  Created by MILES RICHMOND on 10/20/23.
//

import UIKit

class InfoTableViewController: UITableViewController {
    
    var classmates: [Classmate] = []
    var delegate: ViewController!
    var selectedClassmate: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate.classmates = self.classmates
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classmates.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classmate", for: indexPath) as! ClassmateCell
        let addCell = tableView.dequeueReusableCell(withIdentifier: "add", for: indexPath)
        
        if(indexPath.row == classmates.count) {
            return addCell
        }
        
        // Configure the cell...
        
        cell.name_label.text = classmates[indexPath.row].name
        cell.age_label.text = "\(classmates[indexPath.row].age)"
        cell.uID_label.text = "\(classmates[indexPath.row].uID)"

        return cell
    }
    

    
    // For selection of stuff
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedClassmate = indexPath.row
        print(indexPath.row)
        performSegue(withIdentifier: "viewClassmate", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        switch segue.identifier {
        case "add":
            let nextViewController = segue.destination as! AddClassmateViewController
            nextViewController.delegate2 = self
            nextViewController.classmates = self.classmates
        case "viewClassmate":
            let nextViewController = segue.destination as! InfoViewController
            nextViewController.delegate2 = self
            nextViewController.classmates = self.classmates
            nextViewController.targetIndex = selectedClassmate
        default:
            print("huh")
        }
        
    }
    
    @IBAction func add_action(_ sender: UIButton) {
        performSegue(withIdentifier: "add", sender: self)
    }
}
