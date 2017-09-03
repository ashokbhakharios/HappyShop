//
//  BaseServices.swift
//  PropertyGuruTest
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

typealias CompletionBlock = (Any?) -> Void

class BaseServices: NSObject {
    
    enum RequestType: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
        case put = "PUT"
    }
    
    var apiType: APIType?
    var successBlock: CompletionBlock?
    var failureBlock: CompletionBlock?
    
    func getWithURL(_ urlString: String, parameters: Dictionary<String, Any>?) -> URLSessionDataTask? {
        return self.urlsSession(urlString, parameters: parameters, headers: getRequestHeaders(), type: .get)
    }
    
    func postWithURL(_ urlString: String, parameters: Dictionary<String, Any>?) -> URLSessionDataTask? {
        return self.urlsSession(urlString, parameters: parameters, headers: getRequestHeaders(), type: .post)
    }
    
    private func getRequestHeaders() -> Dictionary<String, String>?{
        let headerDict = ["Authorization": "Basic AuthKey"]
        return headerDict
    }
    
    private func urlsSession(_ urlStr: String, parameters: Dictionary<String, Any>?, headers: Dictionary<String, String>?, type: RequestType) -> URLSessionDataTask?{
        
        let tempStr = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.whitespacesAndNewlines.inverted)
        guard let url = URL(string: tempStr!) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = 30
        if let params = parameters {
            let jsonData = try? JSONSerialization.data(withJSONObject: params)
            request.httpBody = jsonData
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                self.didReceivedErrorInResponse(error!)
            }
            else if data != nil{
                self.didReceivedResponse(data!)
            }
        }
        dataTask.resume()
        
        return dataTask
    }
    
    private func didReceivedResponse(_ responseData: Data){
        
        do {
            let response = try JSONSerialization.jsonObject(with: responseData, options: [])
            if let parsedResponse = BaseParser.parseResponse(response, apiType: self.apiType!) {
                self.successBlock?(parsedResponse)
            }
        } catch  {
            self.failureBlock?(nil)
        }
    }
    
    private func didReceivedErrorInResponse(_ error: Error) {
        //Do Create Custom Error Block
        self.failureBlock?(error)
    }
}
