//
//  PinCell.swift
//  Pinterest
//
//  Created by Juan Cabral on 3/28/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit

/*class PinCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var containerView: UIView!
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var captionLabel: UILabel!
    @IBOutlet fileprivate weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
    
    var pin: Pin? {
        didSet {
            if let pin = pin {
                imageView.image = pin.image
                captionLabel.text = pin.caption
                commentLabel.text = pin.comment
            }
        }
    }
    
}*/


class PinCell: UICollectionViewCell {
    
    var pin: Pin? {
        didSet {
            if let pin = pin {
                imageView.image = pin.image
                //captionLabel.text = pin.caption
                //commentLabel.text = pin.comment
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckprofile")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let captionLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Meanwhile, Beast turned to the dark side."
        textLabel.font = UIFont.systemFont(ofSize: 14)
        return textLabel
    }()
    
    let commentLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Meanwhile, Beast turned to the dark side."
        textLabel.font = UIFont.systemFont(ofSize: 14)
        return textLabel
    }()
    

   
    
    func setupViews() {
        backgroundColor = UIColor.white
        addSubview(imageView)
        
        
        //addSubview(captionLabel)
        //addSubview(commentLabel)
        
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}


