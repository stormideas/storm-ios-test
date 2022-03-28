//
//  NetworkingManager.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import Alamofire
import ReachabilitySwift

public enum HTTPServerMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

class NetworkingManager: NSObject {
    
    static let sharedInstance = NetworkingManager()
    
    func checkNetConnection() -> Bool {
        return Reachability()?.isReachable ?? false
    }
    
    func makeRequest(url: String, mType: HTTPServerMethod, params: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.queryString, completionObjectHandler: @escaping (Data) -> Void , faildHandler: @escaping (StatusServer?) -> Void) {
        
        if(!checkNetConnection()){
            faildHandler(StatusServer(message: noInternetConnectionMessage))
            return
        }
        
        let headers : HTTPHeaders = ["Accept-Language": "en" ]
                
        AF.request(baseUrl + url, method: HTTPMethod(rawValue: mType.rawValue), parameters: params , encoding: encoding ,headers:headers)
            .responseJSON{ response in
                if let error = response.error {
                    let status:StatusServer = StatusServer(message: error.localizedDescription)
                    DispatchQueue.main.async {
                        faildHandler(status)
                    }
                    return
                }
                
                if let data = response.data {
                    DispatchQueue.main.async {
                        completionObjectHandler(data)
                    }
                }
        }
    }
}
