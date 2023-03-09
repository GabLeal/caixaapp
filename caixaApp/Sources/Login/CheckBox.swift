//
//  CheckBox.swift
//  caixaApp
//
//  Created by Gabriel Leal dos Santos on 24/11/22.
//

import UIKit

class CheckBox : UIView{
    
    private var isChecked = false
    

    
    private lazy var checkImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "check")
        
        imageView.isHidden = true
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var boxView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(rgb: 0xFFE2E8F0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(rgb: 0xFF1963AC).cgColor
        
        view.frame.size.height = 24
        view.frame.size.width = 24
        
        return view
    }()
    
    private lazy var label : UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var text: String = "" {
        didSet {
            label.text = self.text
            self.window?.widthAnchor.constraint(equalToConstant: 300).isActive
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(boxView)
        addSubview(label)
        boxView.addSubview(checkImage)
        let sizeSpaceLabelBox = label.intrinsicContentSize.width > 0 ? 5.0 : 0.0
       
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 24),
            self.widthAnchor.constraint(equalToConstant: 24),
            //self.widthAnchor.constraint(equalToConstant: label.intrinsicContentSize.width + 24 + sizeSpaceLabelBox),
            checkImage.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            checkImage.centerYAnchor.constraint(equalTo: boxView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: 5),
            label.centerYAnchor.constraint(equalTo: boxView.centerYAnchor)
        ])

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    } 
    
    public func toogle(){
        self.isChecked = !isChecked
        checkImage.isHidden = !self.isChecked
        boxView.backgroundColor =  self.isChecked ? UIColor(rgb: 0xFF1963AC) : UIColor(rgb: 0xFFE2E8F0)
    }
}
