//
//  AccountBrain.swift
//  nft
//
//  Created by wajih on 11/16/21.
//
import UIKit
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
                
               // balance = AccountBrain.parseJSON(res: data)!
                
                
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
    
    static  func postInfo(account : Account) {
        guard let url = URL(string: "http://localhost:3001/customers") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
       request.setValue("application/json", forHTTPHeaderField: "content-type")//applicationjson indicates that we want to get back results in json
        //if we want to use a post we should put the request in the body of the request
       let body:[String:Any] = [
            "wallet_address": account.WalletAddress,
            "name" : account.DisplayName,
            "url": account.CustomUrl,
            "bio":account.Bio,
            "email":account.email,
            "password":account.Password
                    ]
  do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch let error {
            print("an error happen while parssing the body into json ",error)
        }
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
    
    
    static func isValidEmailAddress(emailAddressString: String) -> Bool {
       
       var returnValue = true
       let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
       
       do {
           let regex = try NSRegularExpression(pattern: emailRegEx)
           let nsString = emailAddressString as NSString
           let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
           
           if results.count == 0
           {
               returnValue = false
           }
           
       } catch let error as NSError {
           print("invalid regex: \(error.localizedDescription)")
           returnValue = false
       }
       
       return  returnValue
   }
    
    static func isValidUrl(url: String) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: url)
        return result
    }
    
    static func inputValidation(account:Account,self:UIViewController,image: UIImage?) -> Bool {
        var message = ""
        //let SalePrice = (item.instantSalePrice as NSString).floatValue
        //let auctionPrice = (item.auctionEntrancePrice as NSString).floatValue
        //let date = Date()
        

        

        
        //print(date)
        if account.DisplayName.count > 2 && account.Bio.count > 16 && account.Password.count > 3 && AccountBrain.isValidEmailAddress(emailAddressString: account.email) && isValidUrl(url: account.CustomUrl) && AccountBrain.ifImageExit(image: image) {
            return true
        }
        if account.DisplayName.count <= 2 {
            message = message + "DisplayName should contain at least 3 caractere"
        }
        if account.Bio.count <= 16 {
            message = message + " Bio should contain at least 5 words"
        }
        if account.Password.count <= 3 {
            message = message + " Password should contain at least 4 caracteres"
        }
        if  !AccountBrain.isValidEmailAddress(emailAddressString: account.email) {
            message = message + " Invalid email"
        }
        if !isValidUrl(url: account.CustomUrl) {
            message = message + " Unvalide url "
        }
        if !AccountBrain.ifImageExit(image: image) {
            message = message + " You can not SignUp unless you upload an image"
        }
    
        let alert = UIAlertController(title: "Please chech your information", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok" , style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert,animated: true)
        
        return false
    }
    
    static func ifImageExit(image : UIImage?) -> Bool {
        if  image != nil {
            return true
        }
        return false
        
    }
    static func uploadWithImage(account: Account, image: UIImage){
        let url = URL(string: "http://localhost:3001/customers")
        
        
        let walletAddressBody = "wallet_address"
        let nameBody = "name"
        let urlBody = "url"
        let bioBody = "bio"
        let emailBody = "email"
        let passwordBody = "password"
        let paramName = "profile_picture"
        let fileName = "profile_picture"
        
        
        let name = account.DisplayName
        let walletaddress = account.WalletAddress
        let customurl = account.CustomUrl
        let bio = account.Bio
        let email = account.email
        let password = account.Password
        

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
        data.append("Content-Disposition: form-data; name=\"\(walletAddressBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(walletaddress)".data(using: .utf8)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(nameBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(name)".data(using: .utf8)!)
        /*
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(detailsBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(details)".data(using: .utf8)!)*/
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(urlBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(customurl)".data(using: .utf8)!)
        
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(bioBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(bio)".data(using: .utf8)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(emailBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(email)".data(using: .utf8)!)
        
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(passwordBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(password)".data(using: .utf8)!)
        
                
        
        

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
                    print(data)
                  //  res = AssetsBrain.parseJSON(res: data)!
                    
                }
            semaphore.signal()

                }
                task.resume()
                semaphore.wait()
       // return res
    }
    
    
}

