//
//  APIRequest.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 13/02/22.
//

import Foundation
import UIKit
import Alamofire

class APIRequester: NSObject {
    public static let sharedInstance : APIRequester = APIRequester.init()
    func performRequestWith(request : APIRequestBuilder, completionHandler : @escaping(_ response : Any?,_ status : Bool?, _ errorMsg : String?,_ error : Error?) -> Void) {
        AF.request(request.requestUrl, method: request.method, parameters: request.parameters, encoding: JSONEncoding.default, headers: request.headers) .responseJSON { response in
            switch response.result {
            case .success(_):
                
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [Any] {
                        return completionHandler(json, true, "error", nil)
                    }
                    let json = try JSONSerialization.jsonObject(with: response.data!, options: [])
                    return completionHandler(json, true, "error", nil)
                }
                
                catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    completionHandler(nil, false, error.localizedDescription, error)
                }
                
            case .failure(let error):
                print(error.errorDescription as Any)
                completionHandler(nil, false, error.localizedDescription, error)
                break
            }
        }
    }
}
