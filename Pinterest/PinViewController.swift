//
//  PinViewController.swift
//  Pinterest
//
//  Created by Juan Cabral on 3/28/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit

class PinViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "PinCell"
    var pins = [Pin(caption: "juan", comment: "juan", image: UIImage(named: "pinterest")!),
                Pin(caption: "juan", comment: "juan", image: UIImage(named: "pinterest")!),
                Pin(caption: "juan", comment: "juan", image: UIImage(named: "pinterest")!),
                Pin(caption: "juan", comment: "juan", image: UIImage(named: "pinterest")!),
                Pin(caption: "juan", comment: "juan", image: UIImage(named: "pinterest")!),
                Pin(caption: "juan", comment: "juan", image: UIImage(named: "pinterest")!),
                Pin(caption: "juan", comment: "juan", image: UIImage(named: "pinterest")!),
                Pin(caption: "juan", comment: "juan", image: UIImage(named: "pinterest")!),
                Pin(caption: "juan", comment: "juan", image: UIImage(named: "pinterest")!)]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(PinCell.self, forCellWithReuseIdentifier: cellId)
        
        /*if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }*/
        collectionView?.backgroundColor = .clear
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pins.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! PinCell
        cell.pin = pins[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
    
}


