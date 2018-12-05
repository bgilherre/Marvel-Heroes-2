//
//  APICharacter.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 05/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import Foundation

class APICharacter: NSObject, Codable {
    enum CodingKeys: String, CodingKey {
        //case id
        case name
        case descriptionString = "description"
        case modified
        //case thumbnail
        case resourceURI
        //case comics
    }
    var id: Int32 = 0
    var name: String = ""
    var descriptionString: String = ""
    var modified: String = ""
    var thumbnail: APIImagenCharacter = APIImagenCharacter()
    var resourceURI: String = ""
    var comics: APIComics = APIComics()
    var series: APISeries = APISeries()
    var stories: APIStories = APIStories()
    var events: APIEvents = APIEvents()
    var urls: [APIUrl] = [APIUrl]()
}
