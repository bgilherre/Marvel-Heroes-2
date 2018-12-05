//
//  APIEvents.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 05/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import Foundation

class APIEvents: NSObject, Codable{
    var available: Int = 0
    var collectionURI: String = ""
    var items: [EventAPI] = [EventAPI]()
    var returned: Int = 0
}
class EventAPI: NSObject, Codable{
    var resourceURI: String = ""
    var name: String = ""
}
