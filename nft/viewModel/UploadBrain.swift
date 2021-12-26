//
//  UploadBrain.swift
//  nft
//
//  Created by wajih on 12/26/21.
//

import Foundation
import UIKit
import AVFoundation
struct UploadBrain {
    
    
    func generateBoundary() -> String {
            return "Boundary-\(NSUUID().uuidString)"
        }
    
    func addItem(item : Item , image :UIImage, callback: @escaping (Bool,Any?)->Void){
        
        
       
       guard let mediaImage = Media(withImage: image, forKey: "image") else { return }
       guard let url = URL(string: "http://localhost:3000/article") else { return }
       var request = URLRequest(url: url)
       request.httpMethod = "POST"
       //create boundary
       let boundary = generateBoundary()
       //set content type
       request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
       //call createDataBody method
       
       let dataBody = DataBody(article:article, media: [mediaImage], boundary: boundary)
       request.httpBody = dataBody
       let session = URLSession.shared
       session.dataTask(with: request) { (data, response, error) in
           DispatchQueue.main.async {
         
               if let data = data {
                   let decoder = JSONDecoder()
                   do {
                       let test = try decoder.decode(Article.self, from: data)
                       callback(true,test)
                   }catch{
                       print("erreur de decodage (add): ",error)
                       callback(false,"erreur decodage")
                   }
               } else{
                   callback(false,"no data")
               }
           }
       }.resume()
   }
    

}
    

