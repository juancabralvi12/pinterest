//
//  ViewController.swift
//  Pinterest
//
//  Created by Juan Cabral on 1/31/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        view.addSubview(backgroundImage)
        view.addSubview(profileImageView)
    
        
        
        //constraints
        // constraints for input
        
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/8).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3/5).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 7/8).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let maskedView = UIView(frame: CGRect(x: 0, y: view.bounds.width/2 + 200, width: view.bounds.width, height: 256))
        //let maskedView = UIView()
        maskedView.backgroundColor = .white
        
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = maskedView.bounds
        
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientMaskLayer.locations = [0, 0.1, 0.9, 1]
        maskedView.layer.mask = gradientMaskLayer
        view.addSubview(maskedView)
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(initButton)
        
        
        firstButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 100).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 5).isActive = true
        secondButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor).isActive = true
        secondButton.leftAnchor.constraint(equalTo: firstButton.leftAnchor).isActive = true
        secondButton.rightAnchor.constraint(equalTo: firstButton.rightAnchor).isActive = true
        
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 5).isActive = true
        thirdButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor).isActive = true
        thirdButton.leftAnchor.constraint(equalTo: firstButton.leftAnchor).isActive = true
        thirdButton.rightAnchor.constraint(equalTo: firstButton.rightAnchor).isActive = true
        
        initButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 60).isActive = true
        initButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor).isActive = true
        initButton.leftAnchor.constraint(equalTo: firstButton.leftAnchor).isActive = true
        initButton.rightAnchor.constraint(equalTo: firstButton.rightAnchor).isActive = true
    }
    
    
    let backgroundImage : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        let image = UIImage(named: "login_background")
        iv.image = image
        iv.alpha = 0.8
        return iv
    }()
    
    let profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        let image = UIImage(named: "pinterest")
        iv.image = image
        iv.image = iv.image!.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .red
        
        return iv
    }()
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email"
        tf.backgroundColor = .white
        return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let nameTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Name"
        tf.backgroundColor = .white
        return tf
    }()
    
    let inputContainerView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var firstButton : UIButton = {
       let ub = UIButton()
        ub.backgroundColor = .red
        ub.setTitle("Continuar con el correo electrónico", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.layer.cornerRadius = 10
        ub.layer.masksToBounds = true
        ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        ub.addTarget(self, action: #selector(handleButton2), for: .touchUpInside)
        return ub
    }()
    
    lazy var secondButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)/*UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)*/
        ub.setTitle("Continuar con Facebook", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.layer.cornerRadius = 10
        ub.layer.masksToBounds = true
        ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        ub.addTarget(self, action: #selector(handleButton2), for: .touchUpInside)
        return ub
    }()
    
    lazy var thirdButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = .blue/*UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)*/
        ub.setTitle("Continuar con Google", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        ub.layer.cornerRadius = 10
        ub.layer.masksToBounds = true
        ub.addTarget(self, action: #selector(handleButton2), for: .touchUpInside)
        return ub
    }()
    
    lazy var initButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = .lightGray /*UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)*/
        ub.setTitle("Continuar con Google", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        ub.layer.cornerRadius = 10
        ub.layer.masksToBounds = true
        ub.addTarget(self, action: #selector(handleButton2), for: .touchUpInside)
        return ub
    }()
    
    @objc func handleButton2(){
        var email = EmailLoginController()
        //var user = User()
        email.message = "¿Cuál es tu correo electrónico?"
        email.placeholder = "Correo"
        //email.user = user
        email.loginType = .mail
        self.navigationController?.pushViewController(email, animated: true)
    }

    @objc func handleButton(){
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Not valid")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (user:User?, error) in
            if error != nil {
                print(error)
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            
            //sucessfully
            var ref = Database.database().reference(fromURL: "https://pinterest-7574e.firebaseio.com/")
            let values = ["name" :name, "email": email]
            let usersRef = ref.child("users").child(uid)
            usersRef.updateChildValues(values, withCompletionBlock: { (error, databaseRef:DatabaseReference?) in
                if  error != nil {
                    print(error)
                }
            })
            
            // successfully included
            print("Saved user successfully into our database")
            
        }
    }

}


extension UIColor {
    
    convenience init(r:CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
