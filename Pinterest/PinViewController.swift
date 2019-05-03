//
//  PinViewController.swift
//  Pinterest
//
//  Created by Juan Cabral on 3/28/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit

class PinViewController: UICollectionViewController {
    
    let cellId = "cellId"
    var pins = Pin.allPins()
    
    var statusImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    var zoomImageView = UIImageView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //remove top padding
    override func viewDidLayoutSubviews() {
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(PinCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.backgroundColor = .white
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        
        
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pins.count
    }
}

extension PinViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PinCell else { return }
        
        //cell.pinViewController = self

        let details = PinDetailsController()
        details.image = cell.imageView.image
        
        self.navigationController?.pushViewController(details, animated: false)
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! PinCell
        cell.pin = pins[indexPath.item]
        cell.pinViewController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
    
}

//MARK: - PINTEREST LAYOUT DELEGATE
extension PinViewController : PinterestLayoutDelegate {
    
    
    
    // 1. Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        let height = (self.view.frame.width / pins[indexPath.item].image.size.width) * pins[indexPath.item].image.size.height

        return height
    }
    
    func collectionView(_ collectionView: UICollectionView, maxHeightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        var halfView = collectionView.bounds.height / 2
        return halfView + (halfView / 4)
    }
    
}

//for animation
extension PinViewController {
    
    func animateImageView(statusImageView: UIImageView){
        self.statusImageView = statusImageView
        if let startingFrame = statusImageView.superview?.convert(statusImageView.frame, to: nil),let keyWindow = UIApplication.shared.keyWindow {
            
            zoomImageView.backgroundColor = UIColor.red
            zoomImageView.frame = startingFrame
            zoomImageView.isUserInteractionEnabled = true
            zoomImageView.image = statusImageView.image
            zoomImageView.alpha = 1
            keyWindow.addSubview(zoomImageView)

            let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
            
            UIView.animate(withDuration: 0.20, delay: 0, options: .curveEaseOut, animations: {
                self.zoomImageView.frame = CGRect(x: 0, y:75, width: self.view.frame.width, height: height)
            })
            
            UIView.animate(withDuration: 1, delay: 0, options: .transitionCrossDissolve, animations: {
                self.zoomImageView.alpha = 0
            })
            
            let details = PinDetailsController()
            details.image = statusImageView.image
            details.height = height - 200
            
            self.navigationController?.pushViewController(details, animated: false)
        }
        
    }
}


