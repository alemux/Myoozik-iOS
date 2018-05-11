//
//  UIButtonHelper.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 11/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension UIButton {
    
    
    convenience init?(imageName: String) {
        
        guard UIImage(named: imageName) != nil else {
            return nil
        }
        
        self.init(imageName: imageName)
    }
    
    func setCenteredImage(with name: String) -> UIButton{
        let image = UIImage(named: name)
        return setCenteredImage(with: image!)
    }
    
    func setCenteredImage(with image: UIImage) -> UIButton{
        
        self.layoutIfNeeded()
        
        self.imageView?.contentMode = .scaleAspectFit
        self.setImage(image, for: .normal)
        
        self.imageView?.snp.makeConstraints{ (make) -> Void in
            make.height.equalTo(self.snp.height).multipliedBy(0.6)
            make.center.equalTo(self)
        }
        
        return self
    }
    
    override func updatedSize(){
        super.updatedSize()
        
        if let image = self.imageView?.image {
            self.setCenteredImage(with: image)
        }

        
    }
        
   
    
    
    
    
}
