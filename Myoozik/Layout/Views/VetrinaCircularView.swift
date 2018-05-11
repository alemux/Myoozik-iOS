//
//  VetrinaCircularView.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//

import Foundation
import UIKit

class VetrinaCircularView: UIView {
    
    let artistaCover = UIImageView()
    
    var vetrinaItem: Home.vetrinaband? {
        didSet {
            //titleLabel.text = viewModel?.title
            //imageView.setImageURL(url: viewModel?.imageURL)
            self.artistaCover.sd_setImage(with: URL(string: (vetrinaItem?.cover)!))
        }
    }
    
    required init(bordered: Bool? = nil){
        super.init(frame: .zero)
        artistaCover.addTo(view: self).setPosition(top: 0, right: 0, bottom: 0, left: 0)
        artistaCover.contentMode = .scaleAspectFill

        if let bordered = bordered {
            if bordered {
                artistaCover.setBorder(color: defaultYellow, width: 2)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        artistaCover.setCircular().setBackground(color: UIColor(white: 1, alpha: 0.6))
    }
    
}

