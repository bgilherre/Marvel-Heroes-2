//
//  APIStories.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 05/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import Foundation

class APIStories: NSObject, Codable{
    var available: Int = 0
    var collectionURI: String = ""
    var items: [StorieAPI] = [StorieAPI]()
    var returned: Int = 0
}

class StorieAPI: NSObject, Codable{
    var resourceURI: String = ""
    var name: String = ""
    var type: String = ""
}
