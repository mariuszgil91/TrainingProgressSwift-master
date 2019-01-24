//
//  ExerciseTableViewController.swift
//  TrainingProgress
//
//  Created by Mariusz Gil on 29/12/2018.
//  Copyright © 2018 Mariusz Gil. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class ExerciseTableViewController: UITableViewController {

    var exerciseArray: Results<Exercise>?
    
    var selectedCategory: MainCategory?{
        didSet{
            loadExercises()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadExercises()
       
        tableView.rowHeight = 80.0
        tableView.separatorColor = UIColor.flatOrange
        self.view.backgroundColor = UIColor.flatBlack
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
        
        cell.textLabel?.text = exerciseArray?[indexPath.row].exerciseName ?? "No data"
        
        cell.backgroundColor = UIColor.flatBlack
        cell.textLabel?.textColor = UIColor.flatOrange
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exerciseArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToProgress", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            let destinationProgressVC = segue.destination as! ProgressTableViewController
            
            if let indexPath = tableView.indexPathForSelectedRow{
                destinationProgressVC.selectedCategory1 = exerciseArray?[indexPath.row]
            
        }
        
    }
    
    func loadExercises(){
        
 
        
        exerciseArray = selectedCategory?.exercisesList.sorted(byKeyPath: "exerciseName", ascending: true)
        
        //exerciseArray = realm.objects(Exercise.self)
        
        tableView.reloadData()
        
    }
    
}
