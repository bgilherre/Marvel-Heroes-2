//
//  APIData.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 04/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import Foundation

class APIData: NSObject, Codable{
    var offset: Int = 0
    var limit: Int = 0
    var total: Int = 0
    var count: Int = 0
    var results: [APICharacter] = [APICharacter]()
}
