//
//  HomeViewController.swift
//  LookerETASTE
//
//  Created by 中野柊人 on 2019/10/18.
//  Copyright © 2019 looker. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    let tradeModel = TradeModel()
    
    override func viewDidLoad() {
        self.title = "Looker"
        
        tradeModel.delegate = self
    }
    
    @IBAction func ToItemViewButton(_ sender: Any) {
        tradeModel.getTrade(sneakerId: 1)
    }
    
}

extension HomeViewController: TradeModelDelegate {
    func didRecieveTradeData(tradeModel: TradeModel, tradeHistory: TradeHistroy) {
        print("getTradeSuccess")
        let trades = tradeHistory.trades
        
        let itemViewControllerStoryboard = UIStoryboard(name: "ItemViewController", bundle: nil)
        let itemViewController = itemViewControllerStoryboard.instantiateInitialViewController() as! ItemViewController
        itemViewController.modalPresentationStyle = .overFullScreen
        itemViewController.dataEntries = trades.map {( PointEntry(value: $0.tradePrice, label: $0.tradeDate) )}
        self.navigationController!.pushViewController(itemViewController, animated: true)
    }
    
    func didRecieveTradeError(tradeModel: TradeModel, error: Error) {
        print("getTradeError")
        let itemViewControllerStoryboard = UIStoryboard(name: "ItemViewController", bundle: nil)
        let itemViewController = itemViewControllerStoryboard.instantiateInitialViewController() as! ItemViewController
        itemViewController.modalPresentationStyle = .overFullScreen
        itemViewController.dataEntries = [PointEntry(value: 0, label: "0"), PointEntry(value: 100, label: "100"), PointEntry(value: 100, label: "100"), PointEntry(value: 100, label: "100"), PointEntry(value: 20, label: "20"), PointEntry(value: 30, label: "30"), PointEntry(value: 100, label: "100")]
        self.navigationController!.pushViewController(itemViewController, animated: true)
    }
    
    
}
