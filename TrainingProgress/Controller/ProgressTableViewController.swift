//
//  ProgressTableViewController.swift
//  TrainingProgress
//
//  Created by Mariusz Gil on 31/12/2018.
//  Copyright © 2018 Mariusz Gil. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit
import ChameleonFramework
import Charts
import ChartsRealm


class ProgressTableViewController: UITableViewController {
    
    var exerciseArray: Results<Exercise>?
    var progressHistory: Results<Progress>?
    
    let realm = try! Realm()
    
    var selectedCategory1: Exercise?{
        didSet{
            loadProgress()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadProgress()
        //print(dataFilePath)
        tableView.rowHeight = 80.0
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        tableView.separatorColor = UIColor.flatOrange
        self.view.backgroundColor = UIColor.flatBlack
        

    }
    
    // MARK: - Table view data source methods

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        
        if let progress = progressHistory?[indexPath.row]{
            cell.textLabel?.text = progress.weight
            
        }
        else{
            cell.textLabel?.text = "No weight added"
        }
        
        cell.backgroundColor = UIColor.flatBlack
        cell.textLabel?.textColor = UIColor.flatOrange
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return progressHistory?.count ?? 1
    }

    
    //MARK - Save button pressed
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Save Your Progress", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let action = UIAlertAction(title: "Save", style: .default) { (action) in
            
            //what will happen when clock the save progress button on uialert
            if let currentCategory = self.selectedCategory1{
                do{
                    try self.realm.write {
                        let newPlan = Progress()
                        newPlan.weight = textField.text!
                        newPlan.currentDateTime = Date()
                        currentCategory.progressList.append(newPlan)
                        print("Progress saved to realm")
                    
                    }
                }catch{
                    print("Error saving weight\(error)")
                }
            }
            
           self.tableView.reloadData()
            
        }
        

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add current weight"
            textField = alertTextField
            textField.keyboardType = UIKeyboardType.numberPad
            
        }
        
        alert.addAction(action)
        alert.addAction(cancelAction)
        alert.view.tintColor = UIColor.black
        alert.view.backgroundColor = UIColor.black
        present(alert, animated: true, completion: nil)
        
    
    }
    
    @IBAction func historyButtonPressed(_ sender: UIBarButtonItem) {
        
        print("History btn presed")
        
        performSegue(withIdentifier: "goToHistoryChart", sender: self)
        
    }
    
    
    func loadProgress(){
    
        progressHistory = selectedCategory1?.progressList.sorted(byKeyPath: "currentDateTime", ascending: false)
        //print("progress \(progressHistory)")
        tableView.reloadData()
        
      }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationProgressVC = segue.destination as! HistoryChartViewController
        
        destinationProgressVC.selectedCategory2 = progressHistory
            
        
    }
    
}


//MARK: Swipe cell delegate methods
extension ProgressTableViewController: SwipeTableViewCellDelegate{
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            print("cell swiped: delete")
            
            
            if let categoryForDeletion = self.progressHistory?[indexPath.row]{
            
                do{
                    try self.realm.write {
                        self.realm.delete(categoryForDeletion)
                    }
                }catch{
                    
                    print("error deleting weight: \(error)")
                }
            
               // tableView.reloadData()
            }

        
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        //options.transitionStyle = .border
        return options
    }
    
}
