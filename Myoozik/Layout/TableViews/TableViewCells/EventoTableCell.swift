//
//  EvidenzaTableCell.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//


import Foundation
import UIKit

class EventoTableCell: UITableViewCell {
    
    let cellName = "EvidenzaTableCell"
    let titleLabel = TitleBoldLabel()
    let titleLabel_next = TitleBoldLabel()
    let eventoView = EventoView()
    
    var evento: Home.evento? {
        didSet {
            //titleLabel.text = viewModel?.title
            //imageView.setImageURL(url: viewModel?.imageURL)
            if let evento = evento {
                eventoView.eventoItem = evento
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setBackground(color: defaultDarkGray)
        self.selectionStyle = .none

        eventoView.addTo(view: self).setPosition(top:0, right: 20, bottom: 0, left: 20)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
