//
//  ViewExtension.swift
//  caixaApp
//
//  Created by Gabriel Leal dos Santos on 24/11/22.
//

import UIKit

extension UIView {
    
    func setDefaultGradientBackground() {
        let colorTop =  UIColor(rgb: 0xFF0C6AA9).cgColor
        let colorBottom =  UIColor(rgb: 0xFF4AB0AB).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.startPoint = CGPointMake(0.0, 0.0)
        gradientLayer.endPoint = CGPointMake(1.0, 1.0)
        gradientLayer.frame = self.bounds
                
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}
