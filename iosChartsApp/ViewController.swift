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
    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 5.0, 10.0, 15.0]
        let valueForLineChart: [Int] = [20, 4, 6, 3, 12, 16, 4, 5, 10, 15]
        
        setBarChart(dataPoint: months, values: unitsSold)
        setLineChart(dataPoint: months, values: valueForLineChart)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Local functions
    func setBarChart(dataPoint: [String], values: [Double]){
        
        /*
        Build
            - ChartDataEntries
            - ChartDataSet
            - ChartData
        */
        
        //ChartDataEntries
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoint.count{
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }
        
        //ChartDataset
        let ds1 = BarChartDataSet(values: dataEntries, label: nil)
        
        //ChartData
        let data = BarChartData()
        data.addDataSet(ds1)
        barChartView.data = data
        
        // Formating the chart
        // https://stackoverflow.com/questions/34518228/hide-bottom-x-axis-in-horizontal-bar-chart
        
//        barChartView.isUserInteractionEnabled = false
        
        barChartView.noDataText = "You have not practised any words in last 10 days."
        barChartView.noDataTextColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        barChartView.chartDescription?.text = ""
        barChartView.pinchZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = false
        barChartView.legend.enabled = false
        
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoint)
        
        barChartView.xAxis.granularity = 1
        barChartView.xAxis.centerAxisLabelsEnabled = false
        barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        barChartView.xAxis.drawGridLinesEnabled = false
        
        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawLabelsEnabled = false
        barChartView.leftAxis.drawAxisLineEnabled = false
        
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawLabelsEnabled = false
        barChartView.rightAxis.drawAxisLineEnabled = false
        
        barChartView.fitBars = true
        
    }
    
    //MARK: LineChar
    func setLineChart(dataPoint: [String], values: [Int]){
        /*
         Build
         - ChartDataEntries
         - ChartDataSet
         - ChartData
         */
        
        //ChartDatEntries
        var chartDataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoint.count {
            let value = ChartDataEntry(x: Double(i), y: Double(values[i]))
            chartDataEntries.append(value)
        }
        
        //CharDataSet
        let cDataSet = LineChartDataSet(values: chartDataEntries, label: nil)
        cDataSet.colors = [NSUIColor.blue]
        cDataSet.circleHoleRadius = 0.0
        cDataSet.circleRadius = 3.0
        cDataSet.circleColors = [#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)]
        
        
        //ChartData
        let cData = LineChartData()
        cData.addDataSet(cDataSet)
        
        lineChartView.data = cData
        
        //Format Line chart
        lineChartView.isUserInteractionEnabled = false
        
        lineChartView.legend.enabled = false
        lineChartView.chartDescription?.text = "Your practice last week."
        
        let xAxis = lineChartView.xAxis
        xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoint)
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 1.0
    
        let rightAxis = lineChartView.rightAxis
        rightAxis.drawGridLinesEnabled = false
        rightAxis.drawLabelsEnabled = false
        rightAxis.drawAxisLineEnabled = false
        
        let leftAxis = lineChartView.leftAxis
        leftAxis.drawGridLinesEnabled = false
        leftAxis.drawLabelsEnabled = false
        leftAxis.drawAxisLineEnabled = false
        
    }

}

