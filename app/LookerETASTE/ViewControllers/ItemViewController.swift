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
    var dataEntries: [PointEntry] = []
    var stockGraphDotsPoints: [CGPoint] = []
    
    var isFrontItemInfo = true
    
    var itemXibView: ItemInfoCell!
    var stockGraphView: StockGraphView!
    var viewer3D: Viewer3D!
    let flipDuration = 1.0
    let fadeDuration = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テスト用で適当値段
        buyPriceLabel.text = "¥10,000"
        sellPriceLabel.text = "¥10,000"
        
        setNavigationBar()
        initializeItemInfoView()
        initializeSceneView()
        initializeStockGraphView()
    }
    
    func setNavigationBar() {
        self.title = "Item"
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(tapAction))
        let historyButton = UIBarButtonItem(image: UIImage(named: "History")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(tapHistory))
        self.navigationItem.rightBarButtonItems = [shareButton, historyButton]
    }
    
    func initializeItemInfoView() {
        itemXibView = ItemInfoCell(frame: CGRect(x: 20, y: 200, width: 375, height: 631))
        
        //itemLabelテスト用
        itemXibView.tradePriceLavel.text =  "¥" + "200,000"
        itemXibView.discountPriceLabel.textColor = UIColor.red
        
        itemXibView.tappedFlipButton = {
            UIView.transition(with: self.itemXibView, duration: self.flipDuration, options: [.transitionFlipFromRight], animations: nil, completion: nil)
            UIView.transition(with: self.stockGraphView, duration: self.flipDuration, options: [.transitionFlipFromRight], animations: nil, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self.flipDuration / 2) {
                self.itemXibView.isHidden = !self.isFrontItemInfo
                self.stockGraphView.isHidden = self.isFrontItemInfo
            }
            self.isFrontItemInfo.toggle()
        }
        
        itemXibView.tappedItemImage = {
            UIView.animate(withDuration: self.fadeDuration, delay: 0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.itemXibView.alpha = 0.05
            })
            UIView.animate(withDuration: self.fadeDuration, delay: 0, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.viewer3D.alpha = 1
            })
        }
        
        view.addSubview(itemXibView)
    }
    
    
    @IBAction func toSellViewButton(_ sender: Any) {
        let sizeViewControllerStoryboard = UIStoryboard(name: "SizeViewController", bundle: nil)
        let sizeViewController = sizeViewControllerStoryboard.instantiateInitialViewController() as! SizeViewController
        sizeViewController.modalPresentationStyle = .overFullScreen
        self.navigationController!.pushViewController(sizeViewController, animated: true)
    }
    
    @objc func tapHistory() {
        let dealViewControllerStoryboard = UIStoryboard(name: "DealViewController", bundle: nil)
        let dealViewController = dealViewControllerStoryboard.instantiateInitialViewController() as! DealViewController
        dealViewController.modalPresentationStyle = .overFullScreen
        self.navigationController!.pushViewController(dealViewController, animated: true)
    }
    
    @objc func tapAction() {
        
    }
    
}

// 3Dビュー機能
extension ItemViewController {
    func initializeSceneView() {
        let nib = UINib(nibName: "Viewer3D", bundle: nil)
        viewer3D = nib.instantiate(withOwner: nil, options: nil)[0] as! Viewer3D
        let scene = SCNScene(named: "SceneKit Asset Catalog.scnassets/shoe/shoes_one_center_2 copy.scn")
        viewer3D.sceneView.scene = scene
        viewer3D.sceneView.autoenablesDefaultLighting = true
        node = (scene!.rootNode.childNode(withName: "shoe1", recursively: false))!
        node.position = SCNVector3(0,0,0)
        node.scale = SCNVector3(0.75, 0.75, 0.75)
        viewer3D.sceneView.scene!.rootNode.addChildNode(node)
        // ビュー背景透過
        viewer3D.backgroundColor = UIColor.clear
        viewer3D.sceneView.backgroundColor = UIColor.clear
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.panViewer3D(sender:)))
        viewer3D.addGestureRecognizer(panGestureRecognizer)
        
        viewer3D.center = CGPoint(x: itemXibView.frame.origin.x + itemXibView.frame.size.width / 2, y: itemXibView.frame.origin.y + itemXibView.frame.size.height / 2)
        self.view.addSubview(viewer3D)
        viewer3D.alpha = 0
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


// 株価グラフ機能
extension ItemViewController: LineChartDelegate {
    func didRecieveDotsPoints(lineChart: LineChart, dotsPoints: [CGPoint]) {
        stockGraphDotsPoints = dotsPoints
    }
    
    func initializeStockGraphView() {
        let nib = UINib(nibName: "StockGraphView", bundle: nil)
        stockGraphView = nib.instantiate(withOwner: nil, options: nil)[0] as? StockGraphView
        stockGraphView.curvedLineChart.delegate = self
        // 決め打ちのデータ
        dataEntries = [PointEntry(value: 0, label: "0"), PointEntry(value: 100, label: "100"), PointEntry(value: 100, label: "100"), PointEntry(value: 100, label: "100"), PointEntry(value: 20, label: "20"), PointEntry(value: 30, label: "30"), PointEntry(value: 100, label: "100")]
        
        stockGraphView.pointerSetup()
        stockGraphView.curvedLineChart.dataEntries = dataEntries
        stockGraphView.curvedLineChart.isCurved = true
        stockGraphView.curvedLineChart.lineGap = 60
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.panStockGraphView(sender:)))
        stockGraphView.addGestureRecognizer(panGestureRecognizer)
        stockGraphView.weeklyTabTapped = { [weak self] in
            print("weeklyTabTapped")
        }
        stockGraphView.monthlyTabTapped = { [weak self] in
            print("monthlyTabTapped")
        }
        stockGraphView.threeMonthlyTabTapped = { [weak self] in
            print("threeMonthlyTabTapped")
        }
        stockGraphView.flipButtonTapped = { [weak self] in
            UIView.transition(with: self!.itemXibView, duration: self!.flipDuration, options: [.transitionFlipFromRight], animations: nil, completion: nil)
            UIView.transition(with: self!.stockGraphView, duration: self!.flipDuration, options: [.transitionFlipFromRight], animations: nil, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self!.flipDuration / 2) {
                self!.itemXibView.isHidden = !self!.isFrontItemInfo
                self!.stockGraphView.isHidden = self!.isFrontItemInfo
            }
            self!.isFrontItemInfo.toggle()
        }
        
        stockGraphView.tabsSetup()
        stockGraphView.center = CGPoint(x: itemXibView.frame.origin.x + itemXibView.frame.size.width / 2, y: itemXibView.frame.origin.y + itemXibView.frame.size.height / 2)
        self.view.addSubview(stockGraphView)
        self.view.bringSubviewToFront(stockGraphView.line)
        
        stockGraphView.isHidden = true // 反転のため
    }

    @objc func panStockGraphView(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            stockGraphView.line.isHidden = false
            stockGraphView.pointerGroupView.isHidden = false
            let targetPointIndex = getNearestPointIndex(touchPoint: sender.location(in: view), points: stockGraphDotsPoints)
            adjustPointerPosition(index: targetPointIndex)
        case .changed:
            let targetPointIndex = getNearestPointIndex(touchPoint: sender.location(in: view), points: stockGraphDotsPoints)
            adjustPointerPosition(index: targetPointIndex)
        case .ended:
            stockGraphView.line.isHidden = true
            stockGraphView.pointerGroupView.isHidden = true
        default:
            break
        }
    }
    
    func getNearestPointIndex(touchPoint: CGPoint, points: [CGPoint]) -> Int {
        var nearestPointIndex: Int?
        var mindiff: CGFloat = 10000
        for (index, point) in points.enumerated() {
            let diff = abs(point.x - touchPoint.x)
            if diff <= mindiff {
                nearestPointIndex = index
                mindiff = diff
            }
        }
        return nearestPointIndex!
    }
    
    func adjustPointerPosition(index: Int) {
        let xTargetPos = stockGraphDotsPoints[index].x + stockGraphView.frame.origin.x + stockGraphView.curvedLineChartLeftConstraint.constant
        let yTargetPos = stockGraphDotsPoints[index].y - stockGraphView.curvedLineChart.frame.origin.y - self.view.safeAreaInsets.top
        stockGraphView.lineLeftConstraint.constant = xTargetPos
        stockGraphView.pointerGroupViewHorizontalConstraint.constant = xTargetPos
        stockGraphView.pointerGroupViewVerticalConstraint.constant = yTargetPos
        stockGraphView.pointerPriceLabel.text = String(dataEntries[index].value)
    }

}
