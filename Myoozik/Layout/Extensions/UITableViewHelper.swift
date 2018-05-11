//
//  TableVIew.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 09/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func delegateTo(view: UIViewController) -> UIView{
        if view is UITableViewDelegate {
            self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.delegate = view as? UITableViewDelegate
            self.dataSource = view as? UITableViewDataSource
        }
        return self
    }
    
    func setAutoCellHeight(estimated: Int){
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = CGFloat(estimated)
    }
    
    func setCell(with nibName: String, bundle: Bundle){
        let cellNib = UINib(nibName: nibName, bundle: bundle)
        self.register(cellNib, forCellReuseIdentifier: nibName)
    }
    
    func setCellWith(class customCell: AnyClass?, name: String){
        self.register(customCell, forCellReuseIdentifier: name)
    }
    
    func setPadding(top: CGFloat){
        self.contentInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
    }
    
}
