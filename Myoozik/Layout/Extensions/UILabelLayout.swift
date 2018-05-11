//
//  UILabelLayout.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 11/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    func set(text: String) -> UIView{
        self.text = text
        return self
    }
    func setSystemHeavyWith(size: CGFloat) -> UIView{
        self.font = UIFont.systemFont(ofSize: size, weight: .heavy)
        return self
    }
    func setSystemBoldWith(size: CGFloat) -> UIView{
        self.font = UIFont.systemFont(ofSize: size, weight: .bold)
        return self
    }
    
    func setSystemLightWith(size: CGFloat) -> UIView{
        self.font = UIFont.systemFont(ofSize: size, weight: .light)
        return self
    }
    
    func setSystemWith(size: CGFloat) -> UIView{
        self.font = UIFont.systemFont(ofSize: size, weight: .regular)
        return self
    }
    
    func setLines(n: Int) -> UIView{
        self.numberOfLines = n
        return self
    }
    func setText(color: UIColor) -> UIView {
        self.textColor = color
        return self
    }
    func setLineHeight(with size: CGFloat){
        
    }
    func setUppercase(){
        self.text = self.text?.uppercased()
    }
    func setTestText(){
        self.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sodales sit amet quam eget vehicula. Morbi sed odio id augue bibendum feugiat. Proin imperdiet posuere porttitor. Proin tempus dolor sit amet purus gravida consequat. Praesent quis commodo justo, ut consectetur dui. Pellentesque tempus odio in nulla tristique mattis. Vivamus elementum ipsum id massa fermentum cursus. Vivamus facilisis mi ut ex auctor mattis. Vivamus finibus dignissim semper."
    }
}
