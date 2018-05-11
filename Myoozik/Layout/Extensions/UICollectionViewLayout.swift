//
//  UICollectionViewLayout.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 15/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
        
    func delegateTo(view: UIView) -> UIView{
        if view is UICollectionViewDelegate {
            self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.delegate = view as? UICollectionViewDelegate
            self.dataSource = view as? UICollectionViewDataSource
        }
        return self
    }
    
    func delegateTo(viewController: UIViewController) -> UIView{
        if viewController is UICollectionViewDelegate {
            self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.delegate = viewController as? UICollectionViewDelegate
            self.dataSource = viewController as? UICollectionViewDataSource
        }
        return self
    }
    
    func setAutoCellHeight(estimated: Int){
        
    }
    
    func setCellWith(class customCell: AnyClass?, name: String){
        self.register(customCell, forCellWithReuseIdentifier: name)
    }
    
    func setPadding(top: CGFloat){
        self.contentInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
    }
    
    func setLayout(width: CGFloat? = nil, height: CGFloat? = nil, scrollDirection: UICollectionViewScrollDirection? = nil) -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        
        if let scrollDirection = scrollDirection {
            layout.scrollDirection = scrollDirection
            self.isScrollEnabled = true
        }else {
            self.isScrollEnabled = false
        } //.horizontal
        
        
        if let width = width , let height = height {
            //let cellSize = (UIScreen.main.bounds.size.width - 26) / 4;
            layout.itemSize = CGSize(width: width, height: height)
        }
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        self.setCollectionViewLayout(layout, animated: true)
        return layout
    }
    
    
}

