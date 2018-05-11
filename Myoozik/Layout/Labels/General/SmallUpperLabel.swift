//
//  SmallUpperLabel.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 08/05/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//

import Foundation
import UIKit

class SmallUpperLabel: UILabel {
    
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
        self.setLines(n: 1)
        self.setSystemWith(size: 14)
        self.setText(color: .white)
        self.setUppercase()
    }
    
}

