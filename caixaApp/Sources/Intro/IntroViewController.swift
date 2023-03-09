//
//  IntroViewController.swift
//  caixaApp
//
//  Created by Gabriel Leal dos Santos on 21/11/22.
//

import UIKit

class IntroViewController: UIViewController {
    
    private lazy var image: UIImageView = {
    
        var imageView = UIImageView();
        let image = UIImage(named: "girl-caixa.png")
        imageView.image = image;
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "Mais completo e mais rápido."
        label.font = UIFont.boldSystemFont(ofSize: 42)
        label.textColor = UIColor.white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var labelSubtitle: UILabel = {
        var label = UILabel()
        label.text = "o novo AppCaixa conta com toda modernidade na palma de sua mão."
        label.font = label.font.withSize(14)
        label.textColor = UIColor.white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 8
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var customButton : UICustomButton = {
        let button = UICustomButton(title: "Acessar sua conta" , textColor: UIColor(rgb: 0xFF1963AC) )
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        button.isEnabled = true
        return button
   }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setDefaultGradientBackground()
        
        self.view.addSubview(image)
        self.view.addSubview(labelTitle)
        self.view.addSubview(labelSubtitle)
        self.view.addSubview(customButton)
        //self.view.addSubview(stackView)
        constraintImageCenter()
        constraintLabelTitle()
        constraintLabelSubtitle()
        constraintButton()
    }

    
    private func constraintImageCenter(){
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            image.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            image.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0),
            image.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0),
            //image.heightAnchor.constraint(equalToConstant: 300),
            //image.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    private func constraintLabelTitle(){
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: -40),
            labelTitle.trailingAnchor.constraint(equalTo: image.trailingAnchor,constant: -20),
            labelTitle.leadingAnchor.constraint(equalTo: image.leadingAnchor,constant: 20),
        ])
    }
    
    private func constraintLabelSubtitle(){
        NSLayoutConstraint.activate([
            labelSubtitle.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 20),
            labelSubtitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
            labelSubtitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
        ])
    }
    
    private func constraintButton(){
        NSLayoutConstraint.activate([
            customButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            customButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
            customButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            customButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    
    
    @objc
    private func signIn(sender: UICustomButton){
        sender.showAnimation {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
}

