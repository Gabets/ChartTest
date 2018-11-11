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
    let TIME_DAY = "yyyy-MM-dd"
    let TIME_WEEK = "yyyy-ww"
    let TIME_MONTH = "yyyy-MM"
    let TIME_YEAR = "yyyy"
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var barChart: BarChartView!
    
    var days = [ChartValues]()
    var weeks = [ChartValues]()
    var months = [ChartValues]()
    var years = [ChartValues]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        days.append(ChartValues.init(amount: "120", period: "2018-11-07"))
        days.append(ChartValues.init(amount: "100", period: "2018-11-08"))
        
        weeks.append(ChartValues.init(amount: "220", period: "2018-45"))
        
        months.append(ChartValues.init(amount: "830", period: "2018-09"))
        months.append(ChartValues.init(amount: "220", period: "2018-11"))
        
        years.append(ChartValues.init(amount: "1050", period: "2018"))
        
        let now = Date()
        let locale = Locale(identifier: "ru_RU")

        print(now)
        print(now.description(with: locale))

        print()
        print("Days")
        let dff1 = DateFormatter()
        dff1.dateFormat = TIME_DAY
        print(dff1.string(from: now))
        print("Weeks")
        let dff2 = DateFormatter()
        dff2.dateFormat = TIME_WEEK
        print(dff2.string(from: now))
        print("Months")
        let dff3 = DateFormatter()
        dff3.locale = locale
        dff3.dateFormat = TIME_MONTH
        print(dff3.string(from: now))
        print("Years")
        let dff4 = DateFormatter()
        dff4.dateFormat = TIME_YEAR
        print(dff4.string(from: now))
        
        initChart()
        
    }
    
    @IBAction func changePeriod(_ sender: UISegmentedControl) {
        
        let df = DateFormatter()
        let tz = TimeZone.current.secondsFromGMT() / (60 * 60)
        print("current tz = \(tz)")
        
        var dataSet = [BarChartDataEntry]()
        var i: Double = 1
        print()
        
        switch sender.selectedSegmentIndex {
        case 0:
            df.dateFormat = TIME_DAY
            let stringDateCurrent = df.string(from: Date())
            
            print("days")
            days.forEach({
                dataSet.append(BarChartDataEntry.init(x: i, y: Double($0.amount!)!))
                i += 1
                
                if let date = df.date(from: $0.period!) {
                    print("compare result \(date) and \(stringDateCurrent)")
                    print(date.compare(df.date(from: stringDateCurrent)!).rawValue)
                    
                } else {
                    print("unable parse value: \($0.period!)")
                }
            })
        case 1:
            df.dateFormat = TIME_WEEK
            let stringDateCurrent = df.string(from: Date())
            
            print("weeks")
            weeks.forEach({
                dataSet.append(BarChartDataEntry.init(x: i, y: Double($0.amount!)!))
                i += 1
                
                if let date = df.date(from: $0.period!) {
                    print("compare result \(date) and \(stringDateCurrent)")
                    print(date.compare(df.date(from: stringDateCurrent)!).rawValue)
                    
                } else {
                    print("unable parse value: \($0.period!)")
                }
            })
        case 2:
            df.dateFormat = TIME_MONTH
            let stringDateCurrent = df.string(from: Date())
            
            print("months")
            months.forEach({
                dataSet.append(BarChartDataEntry.init(x: i, y: Double($0.amount!)!))
                i += 1
                
                if let date = df.date(from: $0.period!) {
                    print("compare result \(date) and \(stringDateCurrent)")
                    print(date.compare(df.date(from: stringDateCurrent)!).rawValue)
                    
                } else {
                    print("unable parse value: \($0.period!)")
                }
            })
        case 3:
            df.dateFormat = TIME_YEAR
            let stringDateCurrent = df.string(from: Date())
            
            print("years")
            years.forEach({
                dataSet.append(BarChartDataEntry.init(x: i, y: Double($0.amount!)!))
                i += 1
                
                if let date = df.date(from: $0.period!) {
                    print("compare result \(date) and \(stringDateCurrent)")
                    print(date.compare(df.date(from: stringDateCurrent)!).rawValue)
                    
                } else {
                    print("unable parse value: \($0.period!)")
                }
            })
        default:
            print("LOG not idetified")
        }
        
        barChartUpdate(entryData: dataSet)
        
    }
    
    private func initChart() {
        
        let axisY = barChart.leftAxis
        axisY.removeAllLimitLines()
//        addLimitLine(maxLine)
//        addLimitLine(avgLine)
//        addLimitLine(minLine)
        axisY.setLabelCount(4, force: false)
        axisY.drawAxisLineEnabled = false
        axisY.drawGridLinesEnabled = false
        axisY.drawZeroLineEnabled = false
        axisY.drawLabelsEnabled = false
        
        
        
    }
    
    private func barChartUpdate (entryData: [BarChartDataEntry]) {
        
        let dataSet = BarChartDataSet(values: entryData, label: "Chart data")
        let data = BarChartData(dataSets: [dataSet])
        
        barChart.data = data
        barChart.chartDescription?.text = "Number of Widgets by Type"
        
        
        
        //This must stay at end of function
        barChart.notifyDataSetChanged()
    }
    
    private func getMinValue(entryData: [BarChartDataEntry]) -> Int {
        
        guard !entryData.isEmpty else {
            return 0
        }
        
        
        
        
        return 0
    }


}

