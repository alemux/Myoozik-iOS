//
//  UITableViewCellHelper.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 09/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell{
    func letOverflow(){
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        self.backgroundColor = .clear
        
        self.contentView.clipsToBounds = false
        self.contentView.layer.masksToBounds = false
        self.contentView.backgroundColor = .clear
    }
}
