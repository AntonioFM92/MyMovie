//
//  ApiManager.swift
//  MyMovie
//
//  Created by Antonio Fernández Martín on 26/08/2019.
//  Copyright © 2019 Antonio Fernández Martín. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ApiManager {
    
    typealias ApiCallback = (_ isSuccessful: Bool, _ JSON:Any?, _ fail:String)->Void
    
    func get(url: String, parameters: Parameters, apiCallback: @escaping ApiCallback){
        
        let headers: HTTPHeaders = [ : ]
        
        Alamofire.request(url, method: .get, parameters: parameters, headers: headers).responseJSON{ response in
            print(url)
            print(parameters)
            switch response.result{
                
            case .success(let data) :
                
                switch response.response!.statusCode {
                case (200...300):
                    apiCallback(true,data,"")
                    break
                default:
                    //let errorResponse = Mapper<ErrorDto>().map(JSONObject: data)
                    //apiCallback(false,nil,errorResponse)
                    break
                }
                
            case .failure( _) :
                //var errorModel:ErrorDto = ErrorDto()!
                //let reqErr = RequestError(message:"")
                //errorModel.errors?.append(reqErr!)
                
                //apiCallback(false,nil,errorModel)
                break
                
            }
        }
    }
    
}
