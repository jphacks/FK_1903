//
//  ItemViewController.swift
//  LookerETASTE
//
//  Created by 中野柊人 on 2019/10/18.
//  Copyright © 2019 looker. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

class ItemViewController: UIViewController{
    
    
    @IBOutlet weak var buyPriceLabel: UILabel!
    @IBOutlet weak var sellPriceLabel: UILabel!
    
    var node: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyPriceLabel.text = "¥10,000"
        sellPriceLabel.text = "¥10,000"
        
        self.title = "Item"
        
        initializeSceneView()
        
    }
    
    func initializeSceneView() {
        let nib = UINib(nibName: "Viewer3D", bundle: nil)
        let viewer3D = nib.instantiate(withOwner: nil, options: nil)[0] as! Viewer3D
        let scene = SCNScene(named: "SceneKit Asset Catalog.scnassets/300/shoes_one copy.scn")
        viewer3D.sceneView.scene = scene
        viewer3D.sceneView.autoenablesDefaultLighting = true
        node = (scene!.rootNode.childNode(withName: "shoes1", recursively: false))!
        node.position = SCNVector3(0,0,0)
        viewer3D.sceneView.scene!.rootNode.addChildNode(node)
        // ビュー背景透過
        viewer3D.backgroundColor = UIColor.clear
        viewer3D.sceneView.backgroundColor = UIColor.clear
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.panViewer3D(sender:)))
        viewer3D.addGestureRecognizer(panGestureRecognizer)
        
        viewer3D.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2) // とりあえず中心に
        self.view.addSubview(viewer3D)
    }
    
    @IBAction func toSellViewButton(_ sender: Any) {
        
        let sizeViewControllerStoryboard = UIStoryboard(name: "SizeViewController", bundle: nil)
        let sizeViewController = sizeViewControllerStoryboard.instantiateInitialViewController() as! SizeViewController
        sizeViewController.modalPresentationStyle = .overFullScreen
        self.navigationController!.pushViewController(sizeViewController, animated: true)
        
    }
    
    
}
