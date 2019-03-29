//
//  Pin.swift
//  Pinterest
//
//  Created by Juan Cabral on 3/28/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit


struct Pin {
    
    var caption: String
    var comment: String
    var image: UIImage
    
    
    init(caption: String, comment: String, image: UIImage) {
        self.caption = caption
        self.comment = comment
        self.image = image
    }
    
    init?(dictionary: [String: String]) {
        guard let caption = dictionary["Caption"], let comment = dictionary["Comment"], let photo = dictionary["Photo"],
            let image = UIImage(named: photo) else {
                return nil
        }
        self.init(caption: caption, comment: comment, image: image)
    }
    
    static func allPins() -> [Pin] {
        var photos = [Pin]()
        guard let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
            let photosFromPlist = NSArray(contentsOf: URL) as? [[String:String]] else {
                return photos
        }
        for dictionary in photosFromPlist {
            if let photo = Pin(dictionary: dictionary) {
                photos.append(photo)
            }
        }
        return photos
    }
    
}
