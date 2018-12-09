//
//  Session.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 08/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import Foundation

class Session: NSObject{

    class func createRedSession(endPoint: String) -> (NSMutableURLRequest, URLSession) {
        
        let request: NSMutableURLRequest
        let session = URLSession.shared
        
        let APIKEY: String = "c0252ec5bc3ee9b2c6a0a26e2dfb306d"
        let PRIVKEY: String = "c124cdc74823164742598e641674842fa2de600c"
        
        let ts = NSDate().timeIntervalSince1970.description
        let hash = "\(ts)\(PRIVKEY)\(APIKEY)".md5()!
        
        
        let urlFinal: String = "https://gateway.marvel.com/v1/public/" + endPoint + "?ts=" + ts + "&apikey="  + APIKEY + "&hash=" + hash + "&limit=100"
        
        request = NSMutableURLRequest(url: URL(string: urlFinal)!)
        
        return (request, session)
    }
    
}
