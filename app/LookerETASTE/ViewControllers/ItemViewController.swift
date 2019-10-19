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
    
    @IBOutlet weak var buyButton: UILabel!
    @IBOutlet weak var sealButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyButton.text = "¥10,000"
        sealButton.text = "¥10,000"
        
        self.title = "Item"
        
    }
    
}
