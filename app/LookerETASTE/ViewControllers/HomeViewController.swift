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
    
    override func viewDidLoad() {
        self.title = "Home"
    }
    
    @IBAction func ToItemViewButton(_ sender: Any) {
        let itemViewControllerStoryboard = UIStoryboard(name: "ItemViewController", bundle: nil)
        let itemViewController = itemViewControllerStoryboard.instantiateInitialViewController() as! ItemViewController
        itemViewController.modalPresentationStyle = .overFullScreen
        self.navigationController!.pushViewController(itemViewController, animated: true)
    }
    
}
