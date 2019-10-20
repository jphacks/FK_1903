//
//  TradeModel.swift
//  LookerETASTE
//
//  Created by 石黒晴也 on 2019/10/20.
//  Copyright © 2019 looker. All rights reserved.
//

import Foundation

protocol TradeModelDelegate {
    func didRecieveTradeData(tradeModel: TradeModel, tradeHistory: TradeHistroy)
    func didRecieveTradeError(tradeModel: TradeModel, error: Error)
}

class TradeModel {
    var delegate: TradeModelDelegate?
    
    func getTrade(sneakerId: Int64) {
        TradeAPI.getTrade(sneakerId: sneakerId) { data, error in
            if let error = error {
                self.delegate?.didRecieveTradeError(tradeModel: self, error: error)
            } else {
                self.delegate?.didRecieveTradeData(tradeModel: self, tradeHistory: data!)
            }
        }
    }

}
