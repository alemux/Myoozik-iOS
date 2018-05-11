//
//  VetrinaTableCell.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//


import Foundation
import UIKit
import Hero

class VetrinaTableCell: UITableViewCell {
    
    weak var delegate: HomeDisplayLogic?
    
    let cellName = "VetrinaTableCell"
    var vetrinaView: VetrinaHorizontalCollection?
    let smallTitleLabel = SmallBoldLabel()
    
    var vetrina: [Home.vetrinaband]? {
        didSet {
            //titleLabel.text = viewModel?.title
            //imageView.setImageURL(url: viewModel?.imageURL)
            vetrinaView?.reloadData()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.setBackground(color: defaultDarkGray)
        smallTitleLabel.addTo(view: self).setPosition(top: 30, left: 20)
        smallTitleLabel.set(text: "Vetrina delle band")
        
        
        
        let vetrinaContainer = UIView().addTo(view: self).setSize(height: 70).setPosition(right: 0, bottom: 5, left: 0).setAnchor(top: 8, to: smallTitleLabel)
        
        vetrinaView = VetrinaHorizontalCollection(frame: vetrinaContainer.frame)
        vetrinaView?.delegateTo(view: self).addTo(view: vetrinaContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension VetrinaTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let vetrina = self.vetrina{
            return vetrina.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: (self.vetrinaView?.cellName)!, for: indexPath) as? VetrinaCollectionCell {
            let index = indexPath.row
            cell.vetrina = vetrina?[index]
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 66, height: 66);
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("\n \n DidSelectVetrinaItem \n \n");
        delegate?.showVetrina(index: indexPath.row)
        
    }
}


