//
//  UIBannerLogin.swift
//  caixaApp
//
//  Created by Gabriel Leal dos Santos on 23/11/22.
//

import UIKit

class UIBannerLogin : UIView{
    
    private lazy var logoCaixa: UIImageView = {
        var imageView = UIImageView();
        let image = UIImage(named: "logo_app")
        
        imageView.image = image;
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var girlCaixaBannerImage: UIImageView = {
        var imageView = UIImageView();
        let image = UIImage(named: "girl-caixa-banner")
        
        imageView.image = image;
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelWelcome: UILabel = {
        var label = UILabel()
        label.text = "Seja bem vindo!"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "Aproveite\no seu novo\nAppCaixa."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var labeCopy: UILabel = {
        var label = UILabel()
        label.text = "Luize Visouza\nCorrentista Caixa"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        addbannerItens()
        fatalError("")
    }
    
    
    init(){
        super.init(frame: .zero)
        addbannerItens()
    }
    
    func addbannerItens(){
        //ESTUDAR ESSA PROPRIEDADE
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoCaixa)
        NSLayoutConstraint.activate([
            logoCaixa.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            logoCaixa.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoCaixa.heightAnchor.constraint(equalToConstant: 45)
           
        ])
        
        self.addSubview(girlCaixaBannerImage)
        NSLayoutConstraint.activate([
            girlCaixaBannerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            girlCaixaBannerImage.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20)
           
        ])
        
        self.addSubview(labelWelcome)
        NSLayoutConstraint.activate([
            labelWelcome.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelWelcome.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20)
        ])
        
        self.addSubview(labelTitle)
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor,constant: 4),
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20)
        ])
        
        self.addSubview(labeCopy)
        NSLayoutConstraint.activate([
            labeCopy.topAnchor.constraint(equalTo: labelTitle.bottomAnchor,constant: 20),
            labeCopy.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20)
        ])

    }
}
