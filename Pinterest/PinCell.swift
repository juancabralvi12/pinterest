//
//  PinCell.swift
//  Pinterest
//
//  Created by Juan Cabral on 3/28/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit

class PinCell: UICollectionViewCell {
    
    var pin: Pin? {
        didSet {
            if let pin = pin {
                imageView.image = pin.image
                captionLabel.text = pin.caption
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Meanwhile, Beast turned to the dark side."
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.preferredMaxLayoutWidth = 700
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let moreButton : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "more.png") {
            button.setImage(image, for: .normal)
        }
        return button
    }()
    
    var pinViewController : PinViewController?
    
    @objc func animate (){
        pinViewController?.animateImageView(statusImageView: imageView)
    }
    
    
    
    func setupViews() {
        addSubview(imageView)
        addSubview(captionLabel)
        addSubview(moreButton)
        
        
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))

        
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 9/10).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        captionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5).isActive = true
        captionLabel.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 4/5).isActive = true
        captionLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        captionLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        moreButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5).isActive = true
        moreButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/7).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        moreButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}


