//
//  VetrinaCollectionCell.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//


import Foundation
import UIKit
import Hero

class VetrinaCollectionCell: UICollectionViewCell {
    
    let artista = VetrinaCircularView(bordered: true)
    
    var vetrina: Home.vetrinaband? {
        didSet {
            //titleLabel.text = viewModel?.title
            //imageView.setImageURL(url: viewModel?.imageURL)
            self.artista.vetrinaItem = vetrina
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        // ... and then the rest of the code

        artista.addTo(view: self).setSize(width: 66, height: 66).setCenter(of: self)
        artista.hero.id = "vetrina"

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

