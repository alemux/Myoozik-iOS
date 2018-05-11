//
//  PlacesLabel.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 15/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit

class TextLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        setStyle()
    }
    
    func setStyle(){
        self.textAlignment = .left
        self.setLines(n: 100)
        self.setSystemWith(size: 18)
        //self.setUppercase()
    }
    
}

