//
//  MagnifierView.swift
//  Magnifier
//
//  Created by Chris Chen on 2020/5/12.
//  Copyright © 2020 Dev4App. All rights reserved.
//

import UIKit

//class MagnifierView: UIView {
//
//    var viewToMagnify: UIView!
//    var touchPoint: CGPoint!
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        initView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func initView() {
//        layer.borderColor = UIColor.lightGray.cgColor
//        layer.borderWidth = 3
//        layer.cornerRadius = 50
//        layer.masksToBounds = true
//    }
//
//    func setTouchPoint(point: CGPoint) {
//        touchPoint = point
//        center = CGPoint(x: point.x, y: point.y)
//    }
//
//    override func draw(_ rect: CGRect) {
//        if let context = UIGraphicsGetCurrentContext() {
//            context.translateBy(x: 1 * (self.frame.size.width * 0.5), y: 1 * (self.frame.size.height * 0.5))
//            context.scaleBy(x: 1.5, y: 1.5) // 1.5 is the zoom scale
//            context.translateBy(x: -1 * (touchPoint.x), y: -1 * (touchPoint.y))
//            //        let image = UIGraphicsGetImageFromCurrentImageContext()
//            viewToMagnify.layer.render(in: context)
//        }
//    }
//
//}
class MagnifyView: UIView {

    var viewToMagnify: UIView!
    var touchPoint: CGPoint!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit()
    {
        // Set border color, border width and corner radius of the magnify view
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
    }
    
    func setTouchPoint(pt: CGPoint)
    {
        touchPoint = pt
        self.center = CGPoint(x: pt.x, y: pt.y - 80)
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 1 * (self.frame.size.width * 0.5), y: 1 * (self.frame.size.height * 0.5))
        context!.scaleBy(x: 2, y: 2) // 1.5 is the zoom scale
        context!.translateBy(x: -1 * (touchPoint.x), y: -1 * (touchPoint.y))
        self.viewToMagnify.layer.render(in: context!)
    }

}
