//
//  CGPath_Utility.swift
//  LookerETASTE
//
//  Created by 石黒晴也 on 2019/10/19.
//  Copyright © 2019 looker. All rights reserved.
//

import Foundation
import CoreGraphics

public enum PathElement {
    case moveToPoint(CGPoint)
    case addLineToPoint(CGPoint)
    case addQuadCurveToPoint(CGPoint, CGPoint)
    case addCurveToPoint(CGPoint, CGPoint, CGPoint)
    case closeSubpath
}

internal class Info {
    var pathElements = [PathElement]()
}

public extension CGPath {

    var pathElements: [PathElement] {
        var info = Info()


        self.apply(info: &info) { (info, element) -> Void in

            if let infoPointer = UnsafeMutablePointer<Info>(OpaquePointer(info)) {
                switch element.pointee.type {
                case .moveToPoint:
                    let pt = element.pointee.points[0]
                    infoPointer.pointee.pathElements.append(PathElement.moveToPoint(pt))
                case .addLineToPoint:
                    let pt = element.pointee.points[0]
                    infoPointer.pointee.pathElements.append(PathElement.addLineToPoint(pt))
                case .addQuadCurveToPoint:
                    let pt1 = element.pointee.points[0]
                    let pt2 = element.pointee.points[1]
                    infoPointer.pointee.pathElements.append(PathElement.addQuadCurveToPoint(pt1, pt2))
                case .addCurveToPoint:
                    let pt1 = element.pointee.points[0]
                    let pt2 = element.pointee.points[1]
                    let pt3 = element.pointee.points[2]
                    infoPointer.pointee.pathElements.append(PathElement.addCurveToPoint(pt1, pt2, pt3))
                case .closeSubpath:
                    infoPointer.pointee.pathElements.append(PathElement.closeSubpath)
                }
            }
        }

        return info.pathElements
    }

}
