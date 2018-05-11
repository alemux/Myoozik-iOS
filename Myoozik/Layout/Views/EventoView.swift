//
//  EvidenzaView.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//

import Foundation
import UIKit

class EventoView: UIView {
    
    let artistaCover = UIImageView()
    let eventoNome = EventoCellTitle()
    let infoLabel = EventoCellSubtitle()
    
    var eventoItem: Home.evento? {
        didSet {
            //titleLabel.text = viewModel?.title
            //imageView.setImageURL(url: viewModel?.imageURL)
            if let eventoItem = eventoItem {
                self.artistaCover.sd_setImage(with: URL(string: eventoItem.cover))
                self.eventoNome.text = eventoItem.nome
                self.infoLabel.text = eventoItem.dove + "\n" + eventoItem.quando + "\n" + eventoItem.orario
            }
        }
    }
    
    required init() {
        // set myValue before super.init is called
        
        
        super.init(frame: .zero)
        artistaCover.contentMode = .scaleAspectFill
        artistaCover.addTo(view: self).setPosition(top: 10, bottom: 10, left: 0).setSize(width: 120, height: 120).setBackground(color: .red)
        eventoNome.addTo(view: self).setPosition(top: 10, right: 0).setAnchor(leading: 20, to: artistaCover)
        
        infoLabel.addTo(view: self).setPosition(right: 10).setAnchor(top: 0, to: eventoNome).setAnchor(leading: 45, to: artistaCover)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



