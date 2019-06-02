//
//  OverviewViewController.swift
//  Focus booster
//
//  Created by lvino on 23/5/19.
//  Copyright © 2019 Theron Ann. All rights reserved.
//

import UIKit
import Charts

class OverviewViewController: UIViewController {
    @IBOutlet weak var number1: UISlider!
    @IBOutlet weak var number2: UISlider!
    @IBOutlet weak var number3: UISlider!
    
    var timeAnalysisData = [String:Double]()
    var scoreAnalysisData = [String:Double]()
    
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var pieChart: PieChartView!

    @IBAction func renderCharts() {
        barChartUpdate()
        pieChartUpdate()
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FireBaseManager.shares.getGameTime(completion: { (data) in
            for result in data{
                if let tag = result["tag"] as? String,
                    let time = result["time"] as? Double,
                    let score = result["score"] as? Double{
                    if(!self.timeAnalysisData.keys.contains(tag)){
                        self.timeAnalysisData[tag] = time;
                    }else{
                        self.timeAnalysisData[tag] = self.timeAnalysisData[tag]! + time;
                    }
                    
                    if(!self.scoreAnalysisData.keys.contains(tag)){
                        self.scoreAnalysisData[tag] = score;
                    }else{
                        self.scoreAnalysisData[tag] = self.scoreAnalysisData[tag]! + score;
                    }
                    
                }
            }
            self.barChartUpdate()
            self.pieChartUpdate()
        })
    
        //
       // pieChartUpdate()
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    func barChartUpdate () {
        var barChartEntries = [BarChartDataEntry]()
        var counter:Double = 0.0
        for (key,value) in self.scoreAnalysisData {
            //print("\(key): \(value)")
            barChartEntries.append(BarChartDataEntry(x:counter,y:value))
            counter = counter + 1
        }
        
        let dataSet = BarChartDataSet(entries: barChartEntries, label: "Types")
        //print(dataSet)
        
        var formatter = ChartStringFormatter()
        var names:[String] = []
        for key in self.scoreAnalysisData.keys{
            names.append(key)
        }
        formatter.nameValues = names
        barChart.xAxis.valueFormatter = formatter
        barChart.xAxis.granularity = 1
        
        dataSet.colors = ChartColorTemplates.vordiplom()
        let data = BarChartData(dataSets: [dataSet])
        self.barChart.data = data
        barChart.chartDescription?.text = "Number of Types"
        
        //All other additions to this function will go here
        
        //This must stay at end of function
        barChart.notifyDataSetChanged()
    }
    func pieChartUpdate () {
        //future home of pie chart code
        var pieChartEntries = [PieChartDataEntry]()
        for (key,value) in self.timeAnalysisData {
            //print("\(key): \(value)")
            pieChartEntries.append(PieChartDataEntry(value:value,label:key))
        }
        
        let dataSet = PieChartDataSet(entries: pieChartEntries, label: "Types")
        //print(dataSet)gray

        dataSet.colors = ChartColorTemplates.joyful()
        //dataSet.valueColors = [UIColor.black]
        //pieChart.backgroundColor = UIColor.gray
        pieChart.holeColor = UIColor.clear
        pieChart.chartDescription?.textColor = UIColor.white
        pieChart.legend.textColor = UIColor.white
        
        pieChart.legend.font = UIFont(name: "Futura", size: 10)!
        pieChart.chartDescription?.font = UIFont(name: "Futura", size: 12)!
        pieChart.chartDescription?.xOffset = pieChart.frame.width - 10
        pieChart.chartDescription?.yOffset = pieChart.frame.height * (2/3)
        pieChart.chartDescription?.textAlign = NSTextAlignment.left
        
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChart.chartDescription?.text = "Task Type"
        
        //All other additions to this function will go here
        
        //This must stay at end of function
        pieChart.notifyDataSetChanged()
    }    
}

