//
//  EvidenzaHorizontalCollection.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//

import Foundation
import UIKit

class EvidenzaHorizontalCollection: UICollectionView{
    
    let cellName = "EvidenzaCollectionCell"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    init(frame: CGRect){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 5, right: 0)
        /*let cellSize = frame.size.height - 10
         layout.itemSize = CGSize(width: cellSize, height: cellSize)*/
        
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
        self.setCellWith(class: EvidenzaCollectionCell.self, name: cellName)
        self.isScrollEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.setBackground(color: defaultDarkGray)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

