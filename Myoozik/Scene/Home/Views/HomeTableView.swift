//
//  HomeTableCell.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//

import Foundation
import UIKit

class HomeTableView: UITableView{
    
    let vetrinaCellName = "VetrinaTableCell"
    let evidenzaCellName = "EvidenzaTableCell"
    let eventoCellName = "EventoTableCell"

    init() {
        super.init(frame: CGRect.zero, style: UITableViewStyle.plain)
        setStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(){
        self.setCellWith(class: VetrinaTableCell.self, name: vetrinaCellName)
        self.setCellWith(class: EvidenzaTableCell.self, name: evidenzaCellName)
        self.setCellWith(class: EventoTableCell.self, name: eventoCellName)
        self.setAutoCellHeight(estimated: 300)
        self.setBackground(color: defaultDarkGray)
    }
    
    
    
}

