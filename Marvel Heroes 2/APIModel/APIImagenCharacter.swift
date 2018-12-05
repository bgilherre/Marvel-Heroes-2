//
//  APIImagenCharacter.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 05/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import Foundation

class APIImagenCharacter:NSObject, Codable{
    enum CodingKeys: String, CodingKey {
        case path
        case extensionString = "extension"
    }
    var path: String = ""
    var extensionString: String = ""
}
