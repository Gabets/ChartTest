//
//  ViewController.swift
//  CharTest
//
//  Created by Alex Gabets on 09.11.2018.
//  Copyright © 2018 Alex Gabets. All rights reserved.
//

import UIKit
import Charts

struct ChartValues {
    var amount: String?
    var period: String?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var barChart: BarChartView!
    
    var days = [ChartValues]()
    var weeks = [ChartValues]()
    var months = [ChartValues]()
    var years = [ChartValues]()
        //[{"120"; "2018-11-07"}, {"100"; "2018-11-08"}]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        days.append(ChartValues.init(amount: "120", period: "2018-11-07"))
        days.append(ChartValues.init(amount: "100", period: "2018-11-08"))
        
        weeks.append(ChartValues.init(amount: "220", period: "2018-45"))
        
        months.append(ChartValues.init(amount: "830", period: "2018-09"))
        months.append(ChartValues.init(amount: "220", period: "2018-11"))
        
        years.append(ChartValues.init(amount: "1050", period: "2018"))
    }
    
    @IBAction func changePeriod(_ sender: UISegmentedControl) {
        
        var dataSet = [BarChartDataEntry]()
        var i: Double = 1
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("days")
            days.forEach({
                dataSet.append(BarChartDataEntry.init(x: i, y: Double($0.amount!)!))
                i += 1
            })
        case 1:
            print("weeks")
            weeks.forEach({
                dataSet.append(BarChartDataEntry.init(x: i, y: Double($0.amount!)!))
                i += 1
            })
        case 2:
            print("months")
            months.forEach({
                dataSet.append(BarChartDataEntry.init(x: i, y: Double($0.amount!)!))
                i += 1
            })
        case 3:
            print("years")
            years.forEach({
                dataSet.append(BarChartDataEntry.init(x: i, y: Double($0.amount!)!))
                i += 1
            })
        default:
            print("LOG not idetified")
        }
        
        barChartUpdate(entryData: dataSet)
        
    }
    
    private func barChartUpdate (entryData: [BarChartDataEntry]) {
        
        let dataSet = BarChartDataSet(values: entryData, label: "Chart data")
        let data = BarChartData(dataSets: [dataSet])
        
        barChart.data = data
        barChart.chartDescription?.text = "Number of Widgets by Type"
        
        
        
        //This must stay at end of function
        barChart.notifyDataSetChanged()
    }


}

