//
//  UIStackViewHelper.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 09/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView{
    func removeAllArrangedSubviews() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
