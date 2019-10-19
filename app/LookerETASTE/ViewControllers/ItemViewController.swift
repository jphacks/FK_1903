//
//  ItemViewController.swift
//  LookerETASTE
//
//  Created by 中野柊人 on 2019/10/18.
//  Copyright © 2019 looker. All rights reserved.
//

import Foundation
import UIKit

class ItemViewController: UIViewController{
    
    @IBOutlet weak var buyPriceLabel: UILabel!
    @IBOutlet weak var sellPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テスト用で適当値段
        buyPriceLabel.text = "¥10,000"
        sellPriceLabel.text = "¥10,000"
        
        self.title = "Item"
        
        
        let itemXibView = ItemInfoCell(frame: CGRect(x: 20, y: 200, width: 375, height: 631))
        
        //itemLabelテスト用
        itemXibView.tradePriceLavel.text =  "¥" + "200,000"
        itemXibView.discountPriceLabel.textColor = UIColor.red
        
        view.addSubview(itemXibView)
    
    }
    
    
    @IBAction func toSellViewButton(_ sender: Any) {
        
        let sizeViewControllerStoryboard = UIStoryboard(name: "SizeViewController", bundle: nil)
        let sizeViewController = sizeViewControllerStoryboard.instantiateInitialViewController() as! SizeViewController
        sizeViewController.modalPresentationStyle = .overFullScreen
        self.navigationController!.pushViewController(sizeViewController, animated: true)
        
    }
    
    
}
