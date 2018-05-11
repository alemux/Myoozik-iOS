//
//  EvidenzaCollectionCell.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//


import Foundation
import UIKit
import Hero
import SDWebImage

class EvidenzaCollectionCell: UICollectionViewCell {
    
    let luogo = EvidenzaView()
    
    var evidenza: Home.evidenza? {
        didSet {
            //titleLabel.text = viewModel?.title
            //imageView.setImageURL(url: viewModel?.imageURL)
            if let evidenza = evidenza {
                luogo.evidenzaItem = evidenza
            }
        }
        
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        // ... and then the rest of the code
        self.clipsToBounds = true
        luogo.addTo(view: self).setSize(width: 260, height: 160).setPosition(top: 0, left: 0)
        luogo.hero.id = "ironMan"
    }
    
    /*init(){
     super.init(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
     }*/
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
}

