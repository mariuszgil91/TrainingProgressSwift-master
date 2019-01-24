//
//  MainTableViewController.swift
//  TrainingProgress
//
//  Created by Mariusz Gil on 29/12/2018.
//  Copyright © 2018 Mariusz Gil. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework


class MainTableViewController: UITableViewController {

    var planArray: Results<MainCategory>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        loadMainTable()
        //realm path
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
        tableView.rowHeight = 80.0
        
        tableView.separatorColor = UIColor.flatOrange
        self.view.backgroundColor = UIColor.flatBlack
        
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "planCell", for: indexPath)
        
        cell.textLabel?.text = planArray?[indexPath.row].mainName ?? "No data"
        
        cell.backgroundColor = UIColor.flatBlack
        cell.textLabel?.textColor = UIColor.flatOrange
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return planArray?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToExercise", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
            let destinationExerciseVC = segue.destination as! ExerciseTableViewController
            
            if let indexPath = tableView.indexPathForSelectedRow{
                destinationExerciseVC.selectedCategory = planArray?[indexPath.row]
            }
        
        
    }
    func loadMainTable(){
        let realm = try! Realm()
        planArray = realm.objects(MainCategory.self)
        //planArray = selectedCategory?.exercisesList.sorted(byKeyPath: "mainName", ascending: true)
        
        
        tableView.reloadData()
    }
    
    public func writeCopy(toFile fileURL: URL, encryptionKey: Data? = nil){
        
    }
    
    
    
}
