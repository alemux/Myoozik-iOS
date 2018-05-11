//
//  DayView.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 24/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//

import Foundation
import UIKit

class DayView: UIView {
    
    let dayNumberLabel = EvidenzaCellDayLabel()
    
    required init() {
        // set myValue before super.init is called
        
        super.init(frame: .zero)
        
        
    }
    
    init(color: UIColor, text: String) {
        super.init(frame: .zero)
        setBackground(color: color)
        dayNumberLabel.addTo(view: self).setPosition(top: 5, right: 5, bottom: 5, left: 5)
        dayNumberLabel.set(text: text)
        dayNumberLabel.setText(color: .black)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
