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
            let dataEntry = BarChartDataEntry(x: Double(selectedCategory2!.count - i), y: Double(selectedCategory2![i].weight)!)
            dataEntries.append(dataEntry)

        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "My Progress")
        let chartData = BarChartData(dataSet: chartDataSet)
        barView.data = chartData
        chartDataSet.colors = [UIColor.orange]
        //barView.backgroundColor = UIColor.orange
        barView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barView.noDataTextColor = FlatOrange()
        barView.noDataText = "You need to provide data for the chart."
        chartDataSet.valueTextColor = FlatOrange()
//        barView.leftAxis.axisMinimum = 0.0
//        barView.leftAxis.axisMaximum = 300.0

    }

//            func updateChartWithData() {
//                var dataEntries: [ChartDataEntry] = []
//
//
//                for i in 0..<selectedCategory2!.count{
//                    let axisX: Int = selectedCategory2!.count - i - 1
//                    let axisY: String = selectedCategory2![i].weight
//                    let dataEntry = ChartDataEntry(x: Double(axisX), y: Double(axisY)!)
//                    print("i: \(i), i - 1; \(axisX)")
//
//                    dataEntries.append(dataEntry)
//
//                }
//
//
//                let line1 = LineChartDataSet(values: dataEntries, label: "Progress")
//                let data = LineChartData()
//                data.addDataSet(line1)
//
//                line1.colors = [NSUIColor.orange]
//                barView.data = data
//                //barView.chartDescription?.text = "Progress Graph"
//                //line1.colors = [NSUIColor.white]
//            }
    
}

