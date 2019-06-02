//
//  ChartFormatter.swift
//  Focus booster
//
//  Created by lvino on 2/6/19.
//  Copyright © 2019 Theron Ann. All rights reserved.
//

import Foundation
import Charts

class ChartStringFormatter: NSObject, IAxisValueFormatter {
    
    var nameValues: [String]! =  ["A", "B", "C", "D"]
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return String(describing: nameValues[Int(value)])
    }
}
