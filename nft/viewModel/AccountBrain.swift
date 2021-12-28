//
//  AccountBrain.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import Foundation
struct AccountBrain {
    static func getBalance(address:String) -> Balance {
        var balance = Balance(balance: "")
        guard let url = URL(string: "http://localhost:3001/balance") else { return balance }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
       request.setValue("application/json", forHTTPHeaderField: "content-type")//applicationjson indicates that we want to get back results in json
        //if we want to use a post we should put the request in the body of the request
       let body:[String:Any] = [
        "address":address,
         ]
  do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch let error {
            print("an error happen while parssing the body into json ",error)
        }
        let semaphore = DispatchSemaphore(value: 0)
        let task =  URLSession.shared.dataTask(with: request) {(data,response,error)  in
            
            if let error = error {
                print("an error happen",error)
                return
            }
            if let data = data
            {
                
                balance = AccountBrain.parseJSON(res: data)!
                
                
            }/*{
                do {
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []){
                        
                        print(json)
                    }
                } catch let error  {
                    print("we couldn t parse data into json ",error)
                }
            }*/semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    return balance    }
    
    
    
    
    
    
    
    
    
    
    
    static func parseJSON(res:Data) ->Balance?  {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(Balance.self,from: res)
            return decodedData
        }catch{
            print(error)
            return nil
            
    
    }
    }
    
    
    
    
}

