//
//  CollectionViewSampleController.swift
//  Pinterest
//
//  Created by Juan Cabral on 4/11/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//


import UIKit

class CollectionViewSampleController: UICollectionViewController, UICollectionViewDelegateFlowLayout
 {
    
    var cellId = "cellId"
    var pins = Pin.allPins()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView?.register(PinCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (self.view.frame.width / pins[indexPath.item].image.size.width) * pins[indexPath.item].image.size.height
        
        return CGSize(width: self.view.frame.width/2 - 10, height: height)
    }
    
    func randomFloat(min: CGFloat, max: CGFloat) -> CGFloat {
        return (CGFloat(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pins.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PinCell
        cell.pin = pins[indexPath.item]
        return cell
    }
    
    
}

