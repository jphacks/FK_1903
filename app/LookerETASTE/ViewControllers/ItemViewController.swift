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
        
        buyPriceLabel.text = "¥10,000"
        sellPriceLabel.text = "¥10,000"
        
        self.title = "Item"
        
//        callxib()
    
    }
    
//    func callxib(){
//
//        let nib = UINib(nibName: "ItemInfoCell", bundle: nil)
//        let itemInfoCell = nib.instantiate(withOwner: self, options: nil).first as! ItemInfoCell
//        view.addSubview(itemInfoCell)
//
//    }
    
    
    @IBAction func toSellViewButton(_ sender: Any) {
        
        let sizeViewControllerStoryboard = UIStoryboard(name: "SizeViewController", bundle: nil)
        let sizeViewController = sizeViewControllerStoryboard.instantiateInitialViewController() as! SizeViewController
        sizeViewController.modalPresentationStyle = .overFullScreen
        self.navigationController!.pushViewController(sizeViewController, animated: true)
        
    }
    
    
}
