//
//  ExerciseListTableViewController.swift
//  TrainingProgress
//
//  Created by Mariusz Gil on 28/12/2018.
//  Copyright © 2018 Mariusz Gil. All rights reserved.
//

import UIKit

class Exercise15x3TableViewController: UITableViewController{

   
    var plan15x3Array: Array = [Plan15x3]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newPlan = Plan15x3()
        newPlan.title = "Przysiad ze sztangą"
        plan15x3Array.append(newPlan)
        
        let newPlan1 = Plan15x3()
        newPlan1.title = "Wiosłowanie sztangą"
        plan15x3Array.append(newPlan1)
        
        let newPlan2 = Plan15x3()
        newPlan2.title = "Wyciskanie sztangi leżąc"
        plan15x3Array.append(newPlan2)
        
        let newPlan3 = Plan15x3()
        newPlan3.title = "Podciąganie na drążku"
        plan15x3Array.append(newPlan3)
        
        let newPlan4 = Plan15x3()
        newPlan4.title = "Barki 2 serie"
        plan15x3Array.append(newPlan4)
        
        let newPlan5 = Plan15x3()
        newPlan5.title = "Biceps 2 serie"
        plan15x3Array.append(newPlan5)
        
        let newPlan6 = Plan15x3()
        newPlan6.title = "Triceps 2 serie"
        plan15x3Array.append(newPlan6)
        
        
    
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseNameCell", for: indexPath)

        cell.textLabel?.text = plan15x3Array[indexPath.row].title
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plan15x3Array.count
    }

   

}
