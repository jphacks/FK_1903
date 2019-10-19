//
//  SplashViewController.swift
//  LookerETASTE
//
//  Created by 中野柊人 on 2019/10/18.
//  Copyright © 2019 looker. All rights reserved.
//

import Foundation
import UIKit

class SplashViewController: UIViewController{
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeViewController = storyboard.instantiateInitialViewController() as! HomeViewController
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.modalPresentationStyle = .overFullScreen
        self.present(navigationController, animated: false, completion: nil)
    }
    
}
