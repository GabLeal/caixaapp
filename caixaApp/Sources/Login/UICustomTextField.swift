//
//  UICustomTextfield.swift
//  caixaApp
//
//  Created by Gabriel Leal dos Santos on 24/11/22.
//

import UIKit

class UICustomTextField : UITextField{
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    init(){
        super.init(frame: .zero)
        buildLayout()
    }
    
    private func buildLayout(){
        self.backgroundColor = UIColor(rgb: 0xFFE2E8F0)
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
    }
    
    let padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16);

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
