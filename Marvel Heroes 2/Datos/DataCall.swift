//
//  DataCall.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 09/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import Foundation

class DataCall: NSObject{
    class func giveCharacters(completion: @escaping (([APICharacter]) -> Void)){
        MarvelRed.callAPI(endPoint: "characters", completion: {datos in
            if datos.code == 200{
                completion(datos.data.results)
            }
            
        })
    }
}
