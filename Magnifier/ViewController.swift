//
//  ViewController.swift
//  Magnifier
//
//  Created by Chris Chen on 2020/5/10.
//  Copyright © 2020 Dev4App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    let contentView = MainView()
//    var magnifier: MagnifierView?
    private var magnifyView: MagnifyView?
    var myView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addSubviewConstraints()
//        initView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        
    }

    func addSubviews() {

//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
//        contentView.addGestureRecognizer(tapRecognizer)
//        magnifier.backgroundColor = .white
//        magnifier.layer.cornerRadius = 40
//        magnifier.layer.masksToBounds = true
//
        view.addSubview(myView)
//        view.addSubview(magnifier)
    }
    
    func addSubviewConstraints() {
        
        myView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
//        magnifier.snp.makeConstraints { (make) in
//            make.centerX.equalTo(view.snp.centerX)
//            make.centerY.equalTo(view.snp.centerY)
//            make.width.equalTo(80)
//            make.height.equalTo(80)
//        }
    }

//    func initView() {
////        let image = snapshot(view: contentView, rect: magnifier.frame)
////        magnifier.image = resizeImage(image: image, newSize: magnifier.frame.size)
//    }
//
//    func snapshot(view: UIView, rect: CGRect) -> UIImage {
//        let scale = UIScreen.main.scale
//
//        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, scale)
//        UIGraphicsGetCurrentContext()?.translateBy(x: -rect.origin.x, y: -rect.origin.y)
//        view.layer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//
//        UIGraphicsEndImageContext()
//
//        return image!
//    }
//
//    func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
//        let scale = UIScreen.main.scale
//
//        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
//        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return newImage!
//    }
//
//    @objc func screenTapped() {
//        let image = snapshot(view: contentView, rect: view.frame)
//
//        let viewController = UIViewController()
//        let imageView = UIImageView()
//        imageView.image = resizeImage(image: image, newSize: CGSize(width: view.frame.size.width * 2, height: view.frame.size.height * 2))
//        imageView.contentMode = .center
//        viewController.view.addSubview(imageView)
//        imageView.snp.makeConstraints { (make) in
//            make.edges.equalTo(viewController.view)
//        }
//        present(viewController, animated: true, completion: nil)
////        magnifier.image = resizeImage(image: image, newSize: view.frame.size)
//    }
}


// MARK: touch events
extension ViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        if magnifyView == nil
        {
            magnifyView = MagnifyView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            magnifyView?.viewToMagnify = self.view
            magnifyView?.setTouchPoint(pt: point!)
            self.view.addSubview(magnifyView!)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if magnifyView != nil
        {
            magnifyView?.removeFromSuperview()
            magnifyView = nil
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        magnifyView?.setTouchPoint(pt: point!)
        magnifyView?.setNeedsDisplay()
    }
}
