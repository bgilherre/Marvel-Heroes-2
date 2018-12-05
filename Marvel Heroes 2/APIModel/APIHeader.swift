//
//  APIHeader.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 04/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import Foundation

class HeaderAPI: NSObject, Codable{
    var code: Int = 0
    var status: String = ""
    var copyright: String = ""
    var attributionText: String = ""
    var attributionHTML: String = ""
    var etag: String = ""
    var data: APIData = APIData()
}
