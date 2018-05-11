//
//  EvidenzaTableCell.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 17/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//


import Foundation
import UIKit

class EvidenzaTableCell: UITableViewCell{
    
    weak var delegate: HomeDisplayLogic?
    
    let cellName = "EvidenzaTableCell"
    let usersView = EvidenzaHorizontalCollection()
    let titleLabel = TitleBoldLabel()
    let titleLabel_next = TitleBoldLabel()
    var evidenzaView: EvidenzaHorizontalCollection?
    
    var evidenza: [Home.evidenza]? {
        didSet {
            //titleLabel.text = viewModel?.title
            //imageView.setImageURL(url: viewModel?.imageURL)
            evidenzaView?.reloadData()
        }
    }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setBackground(color: defaultDarkGray)
        self.selectionStyle = .none

        titleLabel.addTo(view: self).setPosition(top: 20, left: 20)
        titleLabel.set(text: "In evidenza")

        let evidenzaContainer = UIView().addTo(view: self).setPosition(right: 0, left: 0).setAnchor(top: 15, to: titleLabel).setSize(height: 210)
        evidenzaView = EvidenzaHorizontalCollection(frame: evidenzaContainer.frame)
        evidenzaView?.delegateTo(view: self).addTo(view: evidenzaContainer)
        
        titleLabel_next.addTo(view: self).setPosition(right: 20, bottom: 10, left: 20).setAnchor(top: 0, to: evidenzaContainer)
        titleLabel_next.set(text: "Eventi in calendario")

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EvidenzaTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let evidenza = self.evidenza {
            return evidenza.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: usersView.cellName, for: indexPath) as? EvidenzaCollectionCell {
            let index = indexPath.row
            cell.evidenza = evidenza?[index]
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 200);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.showEvidenza(index: indexPath.row)
        
    }
}




