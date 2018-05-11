//
//  EvidenzaView.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//


import Foundation
import UIKit



class EvidenzaView: UIView {
    
    let artistaCover = UIImageView()
    let artistaNome = EvidenzaCellTitleLabel()
    let luogoNome = EvidenzaCellPlaceLabel()
    let dayView = DayView(color: defaultYellow, text: "12")
    var isSet = false

    var evidenzaItem: Home.evidenza? {
        didSet {
            if !isSet {
                //titleLabel.text = viewModel?.title
                //imageView.setImageURL(url: viewModel?.imageURL)
                self.artistaCover.sd_setImage(with: URL(string: (evidenzaItem?.cover)!), completed: { (image, error, cacheType, imageURL) in
                    
                })
                self.artistaNome.text = evidenzaItem?.titolo

                self.luogoNome.text = evidenzaItem?.nome
                luogoNome.setUppercase()
                
                self.isSet = true
                
                self.dayView.dayNumberLabel.text = evidenzaItem?.date_label
            }
        }
    }
    
    required init() {
        // set myValue before super.init is called
        
        
        super.init(frame: .zero)
        
        artistaCover.contentMode = .scaleAspectFill
        artistaCover.clipsToBounds = true
        artistaCover.addTo(view: self).setSize(of: self).setPosition(top: 0, right: 0, bottom: 0, left: 0).setBackground(color: .darkGray)
        
        let gradientView = GradientView()
        gradientView.addTo(view: self).setSize(of: self).setPosition(top: 0, right: 0, bottom: 0, left: 0)
        gradientView.topColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        gradientView.bottomColor = .clear
        gradientView.endPointX = gradientView.center.x
        gradientView.endPointY = gradientView.center.y

        
        artistaNome.addTo(view: self).setPosition(right: 20, bottom: 10, left: 20)
        artistaNome.setText(color: .white)
        artistaNome.setSystemWith(size: 28)
        artistaNome.setLineHeight(with: 25)
        
        luogoNome.addTo(view: self).setPosition(right: 20, left: 20).setAnchor(bottom: 0, to: artistaNome)
        luogoNome.setSystemWith(size: 18)
    
        
        dayView.addTo(view: self).setPosition(top: 0, right: 0)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


