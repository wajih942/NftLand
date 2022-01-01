//
//  AssetsBrain.swift
//  nft
//
//  Created by wajih on 11/16/21.
//
import UIKit
import Foundation
import CoreData
struct AssetsBrain {
    
    static func inputValidation(item:Item,image:UIImage?,self:UIViewController) -> Bool {
        var message = ""
        let SalePrice = (item.instantSalePrice as NSString).floatValue
        let auctionPrice = (item.auctionEntrancePrice as NSString).floatValue
        let date = Date()
        

        

        
        print(date)
        if item.itemName.count > 2 && item.description.count > 16 && item.details[0].count > 0 && item.details[0].count > 0 && ( ( item.instantSale && SalePrice > 0) || (item.auctionSale && auctionPrice > 0)) && AssetsBrain.unwrapImage(image: image) {
            return true
        }
        if !AssetsBrain.unwrapImage(image: image) {
            message = message + "Please upload the item image"
        }
        if item.itemName.count <= 2 {
            message = message + "ItemName should contain at least 3 caractere"
        }
        if item.description.count <= 16 {
            message = message + " Description should contain at least 5 words"
        }
        if item.details[0].count <= 0 {
            message = message + " Size should not be empty"
        }
        if item.details[1].count <= 0 {
            message = message + " Proprities should not be empty"
        }
        if item.instantSale {
            if item.instantSalePrice.count == 0 {
                message = message + " Enter the price"
            }else{
                if SalePrice == 0 {
                    message = message + " you can not list items for free"
                }
            }
        }
        if item.auctionSale {
            if item.auctionEntrancePrice.count == 0 {
                message = message + " Enter the price"
            }else{
                if auctionPrice == 0 {
                    message = message + " you can not list items for free"
                }
            }
        }
        let alert = UIAlertController(title: "Input validation warning", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok" , style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert,animated: true)
        
        return false
    }
    
    static func unwrapImage(image : UIImage?) -> Bool {
        if  image != nil {
            return true
        }
        return false
    }
    
    static func sellingState(item:Item,Price:String,state:String) {
        if item.instantSale {
            let Price = item.instantSalePrice + " ETH"
            let state = "Instant sale please verify the item price before continuing"
        }else{
            let Price = item.auctionEntrancePrice + " ETH"
            let state = "Auction Sale please verify the entrance auction price before continuing"
        }
    }
    
    
   
    
    
    
    static func uploadImage(item: Item,paramName: String, fileName: String, image: UIImage,address :String,privateKey:String,gasLimit:String,gasPrice:String) -> MintResponse{
        let url = URL(string: "http://localhost:3001/upload")
        
        var res = MintResponse(err: "", txHash: "", result: "")
        let nameBody = "name"
        let descriptionBody = "description"
        let priceBody = "price"
        let detailsBody = "details"
        let addressBody = "address"
        let privateKeyBody = "privateKey"
        let gaslimitBody = "gaslimit"
        let gasPriceBody = "gasprice"
        
        
        let itemName = item.itemName
        let description = item.description
        var price = ""
        let details = item.details
        if item.instantSale {
             price = item.instantSalePrice
        }else{
             price = item.auctionEntrancePrice
        }
        

        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString

        let session = URLSession.shared

        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"

        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()
        
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(nameBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(itemName)".data(using: .utf8)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(descriptionBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(description)".data(using: .utf8)!)
        /*
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(detailsBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(details)".data(using: .utf8)!)*/
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(priceBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(price)".data(using: .utf8)!)
        
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(addressBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(address)".data(using: .utf8)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(privateKeyBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(privateKey)".data(using: .utf8)!)
        
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(gaslimitBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(gasLimit)".data(using: .utf8)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(gasPriceBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(gasPrice)".data(using: .utf8)!)
        
        
        

        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)

        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Send a POST request to the URL, with the data we created earlier
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.uploadTask(with: urlRequest, from: data) { data, response, error in

                guard error == nil && data != nil else {
                  return
                }

                if let data = data {
                    res = AssetsBrain.parseJSON(res: data)!
                    
                }
            semaphore.signal()

                }
                task.resume()
                semaphore.wait()
        return res
    }
    
    static func createMarketSale(txhash:String,price:String,address:String,privateKey:String,gasLimit:String,gasPrice:String)->MarketSaleResponse  {
        
            var marketsaleResponse = MarketSaleResponse(err: "", txHash: "")
            guard let url = URL(string: "http://localhost:3001/marketsale") else { return marketsaleResponse }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
           request.setValue("application/json", forHTTPHeaderField: "content-type")//applicationjson indicates that we want to get back results in json
            //if we want to use a post we should put the request in the body of the request
           let body:[String:Any] = [
            "txhash":txhash,
            "price":price ,
            "address":address,
            "privateKey":privateKey,
            "gaslimit":gasLimit,
            "gasprice": gasPrice
                
               
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
                    
                    marketsaleResponse = AssetsBrain.parseJSON1(res: data)!
                    
                    
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
        return marketsaleResponse
        
    }
    
    static func parseJSON1(res:Data) ->MarketSaleResponse?  {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(MarketSaleResponse.self,from: res)
            return decodedData
        }catch{
            print(error)
            return nil
            
    
    }
    }
    static func getAllItems() ->[Meta]{
        var items = [Meta]()
        guard let url = URL(string: "http://localhost:3001/allitems") else { return items }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        
       //request.setValue("application/json", forHTTPHeaderField: "content-type")
       let semaphore = DispatchSemaphore(value: 0)
      let task = URLSession.shared.dataTask(with: request) {(data,response,error) in
            
            if let error = error {
                print("an error happen",error)
                return
            }
            if let data = data
            {
                items = AssetsBrain.parseJSON3(res: data)!
                
                
            }
          semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return items
    }
    
    
    static func parseJSON3(res:Data) ->[Meta]?  {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([Meta].self,from: res)
            return decodedData
        }catch{
            print(error)
            return nil
            
    
    }
    }
    static func getImage(url :String) -> UIImage  {
        let url = URL(string: url)!
        var image = UIImage()
        // Create Data Task
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    image = UIImage(data: data)!
                }
            }
            
        }

        // Start Data Task
        dataTask.resume()
        
        return image
    }
    
    
    
    
    
    
    
    static func parseJSON(res:Data) ->MintResponse?  {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(MintResponse.self,from: res)
            return decodedData
        }catch{
            print(error)
            return nil
            
    
    }
    }
    
    static func buyNft(token:String,price:String,address:String,privateKey:String,gasLimit:String,gasPrice:String)->MarketSaleResponse  {
        
            var marketsaleResponse = MarketSaleResponse(err: "", txHash: "")
            guard let url = URL(string: "http://localhost:3001/buynft") else { return marketsaleResponse }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
           request.setValue("application/json", forHTTPHeaderField: "content-type")//applicationjson indicates that we want to get back results in json
            //if we want to use a post we should put the request in the body of the request
           let body:[String:Any] = [
            "token":token,
            "price":price ,
            "address":address,
            "privateKey":privateKey,
            "gaslimit":gasLimit,
            "gasprice": gasPrice
                
               
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
                    
                    marketsaleResponse = AssetsBrain.parseJSON1(res: data)!
                    
                    
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
        return marketsaleResponse
        
    }
    static func prompt(title:String,text:String,self:UIViewController) {
            let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    
    
    
    static func addtoFavorites(meta:Meta,self:UIViewController) {
               let appDelegate = UIApplication.shared.delegate as! AppDelegate
               let persistentContainer = appDelegate.persistentContainer
               let managedContext = persistentContainer.viewContext // list des nsmangedobject
               
               let entityDescription = NSEntityDescription.entity(forEntityName: "Favorites", in: managedContext)
               let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
               
               object.setValue(meta.name!, forKey: "name")
               object.setValue(meta.price!, forKey: "price")
        object.setValue(meta.tokenId!, forKey: "tokenid")
        object.setValue(meta.seller!, forKey: "seller")
        object.setValue(meta.description, forKey: "itemdescription")
        object.setValue(meta.image!, forKey: "imageurl")
        
        
                
                
               
               do{
                   try managedContext.save()
                   prompt(title: "Asset", text: "insert successfully",self: self)
               }catch{
                   print("insert error")
                   prompt(title: "Asset", text: "insert failed",self: self)
               }
               
           }
    }


