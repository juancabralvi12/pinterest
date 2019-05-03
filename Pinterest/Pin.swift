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
    var image: UIImage
    
    
    init(caption: String, image: UIImage) {
        self.caption = caption
        self.image = image
    }
    
    init?(dictionary: [String: String]) {
        guard let caption = dictionary["Caption"], let comment = dictionary["Comment"], let photo = dictionary["Photo"],
            let image = UIImage(named: photo) else {
                return nil
        }
        self.init(caption: caption, image: image)
    }
    
    static func allPins() -> [Pin] {
        var pins = [Pin(caption: "I look a lot like him", image: UIImage(named: "chandler")!),
                    Pin(caption: "Como alimentar a un caniche", image: UIImage(named: "dog")!),
                    Pin(caption: "A great pool", image: UIImage(named: "pool")!),
                    Pin(caption: "", image: UIImage(named: "songs")!)
                    ]
        return pins
    }
    
}
