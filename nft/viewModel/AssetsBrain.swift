//
//  AssetsBrain.swift
//  nft
//
//  Created by wajih on 11/16/21.
//
import UIKit
import Foundation
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
    
    
    
    
    
    
    
    
    func uploadImage(item: Item,paramName: String, fileName: String, image: UIImage) {
        let url = URL(string: "http://localhost:3001/upload")
        
        
        let nameBody = "name"
        let descriptionBody = "description"
        let priceBody = "price"
        
        let itemName = item.itemName
        let description = item.description
        let price = item.instantSalePrice

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
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(priceBody)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(price)".data(using: .utf8)!)

        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)

        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    print(json)
                }
            }
        }).resume()
    }

}
