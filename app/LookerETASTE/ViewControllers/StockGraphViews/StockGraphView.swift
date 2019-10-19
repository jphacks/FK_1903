//
//  StockGraphView.swift
//  LookerETASTE
//
//  Created by 石黒晴也 on 2019/10/19.
//  Copyright © 2019 looker. All rights reserved.
//

import Foundation
import UIKit

class StockGraphView: UIView {
    @IBOutlet weak var curvedLineChart: LineChart!
    @IBOutlet weak var weeklyTab: UIView!
    @IBOutlet weak var monthlyTab: UIView!
    @IBOutlet weak var threeMonthlyTab: UIView!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var lineLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var curvedLineChartLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var pointerGroupView: UIView!
    @IBOutlet weak var pointerGroupViewHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var pointerGroupViewVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var pointerPriceLabel: UILabel!
    
    var weeklyTabTapped: (() -> ())?
    var monthlyTabTapped: (() -> ())?
    var threeMonthlyTabTapped: (() -> ())?
    
    func pointerSetup() {
        line.isHidden = true
        pointerGroupView.isHidden = true
    }
    
    func tabsSetup() {
        weeklyTab.layer.cornerRadius = 10
        monthlyTab.layer.cornerRadius = 10
        threeMonthlyTab.layer.cornerRadius = 10
        
        weeklyTab.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        monthlyTab.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        threeMonthlyTab.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // 最初は「週」タブ以外は薄くする
        weeklyTab.backgroundColor = UIColor.lookerBlack
        monthlyTab.backgroundColor = UIColor.lookerGray
        threeMonthlyTab.backgroundColor = UIColor.lookerGray
        
        let weeklyTabTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapWeeklyTab(sender:)))
        let monthlyTabTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapMonthlyTab(sender:)))
        let threeMonthlyTabTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapThreeMonthlyTab(sender:)))
        weeklyTab.addGestureRecognizer(weeklyTabTapGestureRecognizer)
        monthlyTab.addGestureRecognizer(monthlyTabTapGestureRecognizer)
        threeMonthlyTab.addGestureRecognizer(threeMonthlyTabTapGestureRecognizer)
    }
    
    @objc func tapWeeklyTab(sender: UITapGestureRecognizer) {
        weeklyTab.backgroundColor = UIColor.lookerBlack
        monthlyTab.backgroundColor = UIColor.lookerGray
        threeMonthlyTab.backgroundColor = UIColor.lookerGray
        
        weeklyTabTapped?()
    }
    @objc func tapMonthlyTab(sender: UITapGestureRecognizer) {
        weeklyTab.backgroundColor = UIColor.lookerGray
        monthlyTab.backgroundColor = UIColor.lookerBlack
        threeMonthlyTab.backgroundColor = UIColor.lookerGray
        
        monthlyTabTapped?()
    }
    @objc func tapThreeMonthlyTab(sender: UITapGestureRecognizer) {
        weeklyTab.backgroundColor = UIColor.lookerGray
        monthlyTab.backgroundColor = UIColor.lookerGray
        threeMonthlyTab.backgroundColor = UIColor.lookerBlack
        
        threeMonthlyTabTapped?()
    }
}
