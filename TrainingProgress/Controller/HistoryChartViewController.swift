//
//  HistoryChartViewController.swift
//  TrainingProgress
//
//  Created by Mariusz Gil on 20/01/2019.
//  Copyright © 2019 Mariusz Gil. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
import Charts
import ChartsRealm

class HistoryChartViewController: UIViewController {

    var selectedCategory2: Results<Progress>?
    @IBOutlet var barView: BarChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        updateChartWithData()
        // Do any additional setup after loading the view.
        barView.backgroundColor = FlatGray()
        barView.tintColor = FlatOrange()
        //print(selectedCategory2)
    }
    
    func updateChartWithData() {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<selectedCategory2!.count{
            let dataEntry = BarChartDataEntry(x: Double(selectedCategory2!.count - i), y: Double(selectedCategory2![i].weight)!)
            dataEntries.append(dataEntry)
            
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "My Progress")
        let chartData = BarChartData(dataSet: chartDataSet)
        barView.data = chartData
        
    }

}

