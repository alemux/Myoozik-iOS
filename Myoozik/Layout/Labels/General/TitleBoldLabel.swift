//
//  TitleLabel.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 13/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit

class TitleBoldLabel: UILabel {
    
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
        self.setLines(n: 3)
        self.setSystemHeavyWith(size: 26)
        self.setText(color: .white)
    }
    
}
