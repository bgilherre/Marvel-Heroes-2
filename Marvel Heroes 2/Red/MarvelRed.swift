//
//  MarvelRed.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 05/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import Foundation

class MarvelRed: NSObject{

    
    class func callAPI(endPoint: String, completion: @escaping ((APIHeader) -> Void)){
        
        var request: NSMutableURLRequest = NSMutableURLRequest()
        var session: URLSession = URLSession()
        
        //var retorno: APIHeader?
        
        (request,session) = Session.createRedSession(endPoint : endPoint)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in


            if error == nil || error.debugDescription == ""{
                let result = NSString(data: data!, encoding: String.Encoding.ascii.rawValue)!
                let cadData:String = (result as String)
                if let jsonData = cadData.data(using: .utf8)
                {

                    if let headerAPI = try? JSONDecoder().decode(APIHeader.self, from: jsonData){
                        
                        completion(headerAPI)
                    
                        //print(headerAPI.code)
                        
                    }else{
                        print("error")
                    }
                }else{
                    print(error)
                    //  completion(nil)
                }
            }

        })
        task.resume()

        
    }
}
