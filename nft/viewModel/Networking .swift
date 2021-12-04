//
//  Networking .swift
//  nft
//
//  Created by wajih on 12/3/21.
//
enum HTTP{
    enum Method : String  {
        case get = "GET"
        case post = "POST"
    }
    enum Header{
        enum Field : String {
            case contentType = "Content-Type"
            
        }
        enum value :String{
            case json = "application/json"
            
        }
    }
}

extension URLRequest{
    mutating func addValues(for endpoint : Networking.EndPoint){
        switch endpoint{
        case.req :
            setValue(HTTP.Header.value.json.rawValue , forHTTPHeaderField: HTTP.Header.Field.contentType.rawValue)
        }
    }
}

import Foundation
import CoreText
struct Networking{
    private static let baseURL = "localhost:3001"
    enum EndPoint {
        case req(path : String = "/customers")
        
        var request : URLRequest?{
            guard let url = url else {return nil}
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod
            request.httpBody = httpBody
            request.addValues(for: self)
            return request
            
            }
        private var url: URL?{
            var components = URLComponents()
            components.scheme = "http"
            components.host = path
            components.path = path
            return components.url
            
        }
        private var path:String{
            switch self {
            case .req(let path):
                
            return path
            }
        }
        private var httpMethod:String{
            switch self {
            case .req :
                return HTTP.Method.post.rawValue
            }
        }
        private var httpBody:Data?{
            return try? JSONSerialization.data(withJSONObject: body, options: [])
               
            }
        private var body : [String : Any]{
            switch self {
            case .req:
                return [
                    "key" : "value"
                ]
                
            }
        }
    }
    static func req(){
        guard let request = EndPoint.req().request else {
            return
        }  //empty means that it will use the default value
        URLSession.shared.dataTask(with: request) {(data,response,error) in
            
            if let error = error {
                print("an error happen",error)
                return
            }
            if let data = data {
                do {
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []){
                       print(json)
                    }
                } catch let error  {
                    print("we couldn t parse data into json ",error)
                }
            }
        }.resume()
    }
}

