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

   
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var pieChart: PieChartView!
    
    @IBAction func renderCharts() {
        barChartUpdate()
        pieChartUpdate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartUpdate()
        pieChartUpdate()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func barChartUpdate () {
        //future home of bar chart code
        print(self.number1.value)
        print(self.number2.value)
        print(self.number3.value)
        let entry1 = BarChartDataEntry(x: 1.0, y: Double(number1.value))
        let entry2 = BarChartDataEntry(x: 2.0, y: Double(number2.value))
        let entry3 = BarChartDataEntry(x: 3.0, y: Double(number3.value))
        let dataSet = BarChartDataSet(entries: [entry1, entry2, entry3], label: "Widgets Type")
        print(dataSet)
        let data = BarChartData(dataSets: [dataSet])
        self.barChart.data = data
        barChart.chartDescription?.text = "Number of Widgets by Type"
        
        //All other additions to this function will go here
        
        //This must stay at end of function
        barChart.notifyDataSetChanged()
    }
    func pieChartUpdate () {
        //future home of pie chart code
        let entry1 = PieChartDataEntry(value: Double(number1.value), label: "#1")
        let entry2 = PieChartDataEntry(value: Double(number2.value), label: "#2")
        let entry3 = PieChartDataEntry(value: Double(number3.value), label: "#3")
        let dataSet = PieChartDataSet(entries: [entry1, entry2, entry3], label: "Widget Types")
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChart.chartDescription?.text = "Share of Widgets by Type"
        
        //All other additions to this function will go here
        
        //This must stay at end of function
        pieChart.notifyDataSetChanged()
    }    
}

