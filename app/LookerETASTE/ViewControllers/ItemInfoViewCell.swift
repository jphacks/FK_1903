//
//  ItemInfoViewCell.swift
//  LookerETASTE
//
//  Created by 中野柊人 on 2019/10/19.
//  Copyright © 2019 looker. All rights reserved.
//

import UIKit

class ItemInfoViewCell: UITableViewCell {
    
    @IBOutlet weak var sneakerImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var partNoLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var releaceDateLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    
    
    // コードから生成した時の初期化処理
//       override init(frame: CGRect) {
//           super.init(frame: frame)
//           self.nibInit()
//       }
    
    
    @IBAction func to3DViewButton(_ sender: Any) {
    }
    
}
