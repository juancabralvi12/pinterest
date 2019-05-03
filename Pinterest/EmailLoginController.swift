//
//  EmailLoginController.swift
//  Pinterest
//
//  Created by Juan Cabral on 2/28/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class EmailLoginController:  UIViewController {
    
    enum LoginType {
        case mail
        case password
        case age
    }
    var loginType:LoginType?
    var message:String?
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Regístrate"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Return", style: .plain, target: self, action: #selector(dismissController))
        
        view.addSubview(label)
        view.addSubview(tf)
        view.addSubview(firstButton)
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        label.heightAnchor.constraint(equalToConstant: 53).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        tf.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        tf.heightAnchor.constraint(equalToConstant: 53).isActive = true
        tf.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        tf.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(viewGray)
        view.addSubview(viewBlack)
        
        viewGray.bottomAnchor.constraint(equalTo: firstButton.topAnchor, constant: -10).isActive = true
        viewGray.heightAnchor.constraint(equalToConstant: 10).isActive = true
        viewGray.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        viewGray.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        viewBlack.bottomAnchor.constraint(equalTo: viewGray.bottomAnchor).isActive = true
        viewBlack.heightAnchor.constraint(equalTo: viewGray.heightAnchor).isActive = true
        viewBlack.widthAnchor.constraint(equalTo: viewGray.widthAnchor, multiplier: 1/3).isActive = true
        viewBlack.leftAnchor.constraint(equalTo: viewGray.leftAnchor).isActive = true
    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc func dismissController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    lazy var label : UILabel = {
       let l = UILabel()
        l.text = message
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var placeholder: String?
    
    lazy var tf : UITextField = {
        let tf = UITextField()
        tf.becomeFirstResponder()
        if let pl = placeholder {
        tf.attributedPlaceholder = NSAttributedString(string: pl, attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 40.0)
            ])
        }
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let viewGray : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewBlack : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = .red
        ub.setTitle("Siguiente", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.layer.cornerRadius = 2
        ub.layer.masksToBounds = true
        ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        ub.addTarget(self, action: #selector(handleButton2), for: .touchUpInside)
        return ub
    }()
    
    @objc func handleButton2(){
        if let log = loginType {
        switch log {
        case .mail:
            var email = EmailLoginController()
            email.message = "Crea una contraseña"
            email.placeholder = "Contraseña"
            email.loginType = .password
            self.navigationController?.pushViewController(email, animated: true)
        case .password:
            var email = EmailLoginController()
            email.message = "¿Qué edad tienes?"
            email.placeholder = "Edad"
            email.loginType = .age
            self.navigationController?.pushViewController(email, animated: true)
        case .age:
            var pinView = PinViewController(collectionViewLayout: PinterestLayout())
            self.navigationController?.pushViewController(pinView, animated: true)
            print("We have an user to be register")
        }
        }
        
        
    }
}

