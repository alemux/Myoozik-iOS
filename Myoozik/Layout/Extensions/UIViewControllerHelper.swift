//
//  ViewControllerHelper.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 09/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit
import Hero

extension UIViewController{
    
    
    func getBundle() -> Bundle{
        let bundle = Bundle(for: type(of: self))
        return bundle
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
    
}
