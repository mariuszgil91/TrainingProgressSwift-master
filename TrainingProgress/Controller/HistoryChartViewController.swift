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
        //print(selectedCategory2)
    }
    
    func updateChartWithData() {
        var dataEntries: [BarChartDataEntry] = []

        
        
        
        for i in 0..<selectedCategory2!.count{
            
            let axisX: Int = selectedCategory2!.count - i - 1
            let axisY: String = selectedCategory2![i].weight
            let dataEntry = BarChartDataEntry(x: Double(axisX), y: Double(axisY)!)
            dataEntries.append(dataEntry)

        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "My Progress")
        let chartData = BarChartData(dataSet: chartDataSet)
        barView.data = chartData
        
        chartDataSet.colors = [UIColor.orange]
        //chartDataSet.valueTextColor = FlatOrange()
        //chartDataSet.valueColors = [UIColor.orange]
        chartDataSet.highlightEnabled = false
        //barView.gridBackgroundColor = FlatOrange()
        barView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        //barView.leftAxis.axisMinimum = 0.0
        //barView.leftAxis.axisMaximum = 200.0

    }

    
}

