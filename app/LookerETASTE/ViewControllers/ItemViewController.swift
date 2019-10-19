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
    
    @IBOutlet weak var buyButton: UILabel!
    @IBOutlet weak var sealButton: UILabel!
    
    var node: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyButton.text = "¥10,000"
        sealButton.text = "¥10,000"
        
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
    
    @objc func panViewer3D(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            let deviation: CGPoint = sender.translation(in: view)
            let rotation: CGFloat =  (CGFloat(Float.pi / 180) / 2) // オイラー角
            node.eulerAngles = SCNVector3(CGFloat(node.eulerAngles.x) + deviation.y * rotation, CGFloat(node.eulerAngles.y) + deviation.x * rotation, 0)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: view)
        case .ended:
            break
        default:
            break
        }
    }
}
