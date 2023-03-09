//
//  LoginViewController.swift
//  caixaApp
//
//  Created by Gabriel Leal dos Santos on 23/11/22.
//

import Foundation

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var banner: UIBannerLogin = {
        var banner = UIBannerLogin()
        return banner
    }()
    
    private lazy var forms: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var usernameLabel : UILabel = {
        var label = UILabel()
        label.text = "Usuário"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkbox : CheckBox = {
        var checkBox = CheckBox()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(signIn))
        checkBox.addGestureRecognizer(tap)
        checkBox.isUserInteractionEnabled = true
        
        checkBox.text = "Lembrar usuário"
        
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        
        return checkBox
    }()
    
    
    private lazy var usernameTextfield : UICustomTextField = {
        var textfield = UICustomTextField()
        
            
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var passwordLabel : UILabel = {
        var label = UILabel()
        label.text = "Senha"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextfield : UICustomTextField = {
        var textfield = UICustomTextField()
        textfield.isSecureTextEntry = true
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var customButton : UICustomButton = {
        let button = UICustomButton(title: "Acessar sua conta" , textColor: .white )
        button.backgroundColor =  UIColor(rgb: 0xFFFFFFFF,alpha: 0.15)
        //button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        button.isEnabled = true
        return button
   }()
    
    
    lazy var accessButton : UICustomButton = {
        let button = UICustomButton(title: "Acessar sua conta" , textColor: .white )
        button.backgroundColor =  UIColor(rgb: 0xFF1963AC)
        //button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        button.isEnabled = true
        return button
   }()
    
    
    @objc private func signIn(){
        checkbox.toogle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aaaaaa")
        self.navigationController?.isNavigationBarHidden = true
        self.view.setDefaultGradientBackground()
        
        self.view.addSubview(banner)
        contraintsBanner()
        
        self.view.addSubview(forms)
        contraintsForms()
        
        self.view.addSubview(customButton)
        NSLayoutConstraint.activate([
            customButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            customButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
            customButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            customButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func contraintsBanner(){
        NSLayoutConstraint.activate([
            banner.topAnchor.constraint(equalTo: self.view.topAnchor),
            banner.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            banner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            banner.heightAnchor.constraint(equalToConstant: 354)
        ])
    }
    
    func contraintsForms(){
        
        forms.addSubview(usernameTextfield)
        forms.addSubview(checkbox)
        forms.addSubview(passwordTextfield)
        forms.addSubview(usernameLabel)
        forms.addSubview(passwordLabel)
        forms.addSubview(accessButton)
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: forms.topAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            usernameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            checkbox.topAnchor.constraint(equalTo: forms.topAnchor, constant: 24),
            checkbox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            usernameTextfield.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 16),
            usernameTextfield.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            usernameTextfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 16),
            passwordLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            passwordLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            passwordTextfield.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
            passwordTextfield.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            passwordTextfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            accessButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 16),
            accessButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            accessButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            accessButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            forms.topAnchor.constraint(equalTo: banner.bottomAnchor),
            forms.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            forms.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            forms.heightAnchor.constraint(equalToConstant: 354)
        ])
    }
}
