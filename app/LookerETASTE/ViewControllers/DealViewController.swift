//
//  DealViewController.swift
//  LookerETASTE
//
//  Created by 石黒晴也 on 2019/10/20.
//  Copyright © 2019 looker. All rights reserved.
//

import Foundation
import UIKit

class DealViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Item"
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        self.navigationItem.rightBarButtonItems = [shareButton]
        
        imageView.image = UIImage(named:"Deal")
    }
    @IBAction func tapDealTab(_ sender: Any) {
        imageView.image = UIImage(named:"Deal")
    }
    @IBAction func tapExhibitTab(_ sender: Any) {
        imageView.image = UIImage(named:"Exhibit")
    }
    @IBAction func tapBidTag(_ sender: Any) {
        imageView.image = UIImage(named:"Bid")
    }
}
