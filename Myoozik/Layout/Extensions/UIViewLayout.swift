//
//  UIViewHelper.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 09/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

enum Properties {
    case radiusPercentage
    case radiusValue
}

extension UIView{

    private struct Keys {
        static var radiusPercentage : CGFloat = 0
        static var radiusValue : CGFloat = 0
    }
    
    var properties: Properties? {
        get {
            return objc_getAssociatedObject(self, &UIView.Keys.radiusPercentage) as? Properties
        }
        set {
            objc_setAssociatedObject(self, &UIView.Keys.radiusPercentage, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    @objc func updatedSize(){
        print("PP: \(Keys.radiusPercentage)");
        if Keys.radiusPercentage > 0 {
            //self.setRadius(by: Keys.radiusPercentage)
        }
    }
    
    func addTo(view: UIView) -> UIView {
        view.addSubview(self)
        return self
    }

    func setCenter(x: UIView? = nil, y: UIView? = nil, of: UIView? = nil) -> UIView{
        
        self.snp.makeConstraints { (make) -> Void in
            if let of = of {
                make.centerX.equalTo(of)
                make.centerY.equalTo(of)
            } else {
                if let x = x { make.centerX.equalTo(x) }
                if let y = y { make.centerY.equalTo(y) }
            }
        }
        
        //self.updatedSize()
        
        return self
    }
    
    func setSize(width: CGFloat? = nil, height: CGFloat? = nil, of view: UIView? = nil) -> UIView{
        
        self.snp.makeConstraints { (make) -> Void in
            if let view = view {
                make.width.equalTo(view.frame.size.width)
                make.height.equalTo(view.frame.size.height)
            } else {
                if let width = width { make.width.equalTo(width) }
                if let height = height { make.height.equalTo(height) }
            }
        }
        
        //self.updatedSize()
        
        return self
    }
    
    
    func setPosition(top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil, priority: CGFloat? = nil) -> UIView{
        if let priority = priority {
            self.snp.makeConstraints { (make) -> Void in
                if let top = top { make.top.equalTo(top).priority(priority) }
                if let right = right { make.right.equalTo(-right).priority(priority) }
                if let bottom = bottom { make.bottom.equalTo(-bottom).priority(priority) }
                if let left = left { make.left.equalTo(left).priority(priority) }
            }
        }else{
            self.snp.makeConstraints { (make) -> Void in
                if let top = top { make.top.equalTo(top) }
                if let right = right { make.right.equalTo(-right) }
                if let bottom = bottom { make.bottom.equalTo(-bottom) }
                if let left = left { make.left.equalTo(left) }
            }
        }
        
        //self.updatedSize()
        
        return self
    }
   
    
    func setAnchor(top value: CGFloat, to view: UIView) -> UIView{
        self.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.snp.bottom).offset(value)
        }
        
        return self
    }
    
    func setAnchor(trailing value: CGFloat, to view: UIView) -> UIView{
        self.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(view.snp.left).offset(-value)
        }
        
        return self
    }
    
    func setAnchor(bottom value: CGFloat, to view: UIView) -> UIView{
        self.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(view.snp.top).offset(-value)
        }
        
        return self
    }
    
    func setAnchor(leading value: CGFloat, to view: UIView) -> UIView{
        self.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(view.snp.right).offset(value)
        }
        
        return self
    }
    
    
    func setPaddingBy(percentage: Int){
        let frame = self.frame
        let pd = frame.size.width * CGFloat(percentage) / 100
        self.frame.insetBy(dx: pd, dy: pd)
    }
    
    func setPaddingByPercentage(x: Int, y: Int){
        let frame = self.frame
        let py = frame.size.width * CGFloat(x) / 100
        let px = frame.size.width * CGFloat(x) / 100
        self.frame.insetBy(dx: CGFloat(px), dy: CGFloat(py))
    }
    
    func setCircular() -> UIView{
        return setRadius(by: 50)
    }
    
    @objc func setRadius(by percentage: CGFloat) -> UIView {
        Keys.radiusPercentage = percentage
        let radius = self.frame.size.width / 100 * percentage
        return self.set(radius: radius)
    }
    
    func set(radius: CGFloat) -> UIView{
        self.layoutIfNeeded()
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    
    func putShadowOnView(viewToWorkUpon:UIView, shadowColor:UIColor, radius:CGFloat, offset:CGSize, opacity:Float)-> UIView{
        
        var shadowFrame = CGRect.zero // Modify this if needed
        shadowFrame.size.width = 0.0
        shadowFrame.size.height = 0.0
        shadowFrame.origin.x = 0.0
        shadowFrame.origin.y = 0.0
        
        var shadow = UIView(frame: shadowFrame)//[[UIView alloc] initWithFrame:shadowFrame];
        shadow.isUserInteractionEnabled = false; // Modify this if needed
        shadow.layer.shadowColor = shadowColor.cgColor
        shadow.layer.shadowOffset = offset
        shadow.layer.shadowRadius = radius
        shadow.layer.masksToBounds = false
        shadow.clipsToBounds = false
        shadow.layer.shadowOpacity = opacity
        viewToWorkUpon.superview?.insertSubview(shadow, belowSubview: viewToWorkUpon)
        shadow.addSubview(viewToWorkUpon)
        return shadow
    }
    
    func setBackground(color: UIColor) -> UIView{
        self.backgroundColor = color
        return self
    }
    
    func setBorder(color: UIColor? = nil, width: CGFloat? = nil){
        if let color = color {
            self.layer.borderColor = color.cgColor
        }
        if let width = width {
            self.layer.borderWidth = width
        }
    }
    
    func endCreation() -> UIView {
        self.layoutIfNeeded()
        return self
    }
    
    func screenHeight() -> CGFloat{
        return UIScreen.main.bounds.size.height
    }
    
    func screenWidth() -> CGFloat{
        return UIScreen.main.bounds.size.width
    }
}

extension UIResponder {
    func getParentViewController() -> UIViewController? {
        if self.next is UIViewController {
            return self.next as? UIViewController
        } else {
            if self.next != nil {
                return (self.next!).getParentViewController()
            }
            else {return nil}
        }
    }
}


