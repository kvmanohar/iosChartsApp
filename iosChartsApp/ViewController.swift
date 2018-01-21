//
//  ViewController.swift
//  iosChartsApp
//
//  Created by Manohar Kurapati on 20/01/2018.
//  Copyright © 2018 Manosoft. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0]
        
        setChart(dataPoint: months, values: unitsSold)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Local functions
    func setChart(dataPoint: [String], values: [Double]){
        
        /*
        Build
            - ChartDataEntries
            - ChartDataSet
            - ChartData
        */
        
        var dataEntries: [BarChartDataEntry] = []
        let data = BarChartData()
        for i in 0..<dataPoint.count{
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }
        
        let ds1 = BarChartDataSet(values: dataEntries, label: "Months")
        
        data.addDataSet(ds1)
        barChartView.data = data
        
        //Formating the chart
        barChartView.noDataText = "You have not practised any words in last 10 days."
        barChartView.noDataTextColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoint)
        
        
        barChartView.xAxis.granularity = 1
        barChartView.xAxis.centerAxisLabelsEnabled = true
        barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawGridLinesEnabled = false
        
        barChartView.fitBars = true
        
        
    }

}

