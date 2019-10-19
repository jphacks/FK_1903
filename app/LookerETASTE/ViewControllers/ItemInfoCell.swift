//
//  ItemInfoSell.swift
//  LookerETASTE
//
//  Created by 中野柊人 on 2019/10/19.
//  Copyright © 2019 looker. All rights reserved.
//

import UIKit

class ItemInfoCell: UIView {

    override init(frame: CGRect){
           super.init(frame: frame)
           loadNib()
       }
    
       required init(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)!
           loadNib()
       }
    
       func loadNib(){
           let view = Bundle.main.loadNibNamed("ItemInfoCell", owner: self, options: nil)?.first as! UIView
           view.frame = self.bounds
           self.addSubview(view)
       }

}

extension UIView {

    // 枠線の色
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    // 枠線のWidth
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    // 角丸設定
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
