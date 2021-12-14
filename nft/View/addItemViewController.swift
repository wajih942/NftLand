//
//  addItemViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class addItemViewController: UIViewController {

    //var
    var info = mintInfo(url: "", hash: "")
    var privatekey2 : String?
    var address2 : String?
    
    //functions
    
    func postRequest (name:String ,description:String ,price:String,address:String,privateKey:String) {
        
        guard let url = URL(string: "http://localhost:3001/upload") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
       request.setValue("application/json", forHTTPHeaderField: "content-type")//applicationjson indicates that we want to get back results in json
        //if we want to use a post we should put the request in the body of the request
       let body:[String:Any] = [
            "name": name,
            "description" :description,
            "price" : price,
            "privateKey": privateKey  ,
            "address" : address
           
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
                
                self.info = self.parseJSON(info: data)!
                print(self.info)
                
                
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
    }
   
    func parseJSON(info:Data) ->mintInfo?  {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(mintInfo.self,from: info)
            return decodedData
        }catch{
            print(error)
            return nil
        }}
    //iboutlets
    struct mintInfo : Decodable {
        let url:String?
        let hash:String?
    }
    
    @IBOutlet weak var singleToMutipleLabel: UILabel!
    
    @IBOutlet weak var itemNameText: UITextField!
    //ibactions
    @IBOutlet weak var descriptionText: UITextField!
    
    @IBOutlet weak var priceText: UITextField!
    //ibactions
    @IBAction func notificationButton(_ sender: Any) {
    }
    
    
    @IBAction func profileButton(_ sender: Any) {
    }
    
    @IBAction func burgerButton(_ sender: Any) {
    }
    
    
    @IBAction func switchToMultipleButton(_ sender: Any) {
    }
    
    @IBAction func uploadButton(_ sender: Any) {
    }
    
    
    @IBAction func itemNameText(_ sender: Any) {
    }
    
    @IBAction func descriptionText(_ sender: Any) {
    }
    
    
    @IBAction func royaltiesButton(_ sender: Any) {
    }
    
    @IBAction func sizeText(_ sender: Any) {
    }
    
    
    @IBAction func propertieText(_ sender: Any) {
    }
    
    
    @IBAction func saleSwitch(_ sender: Any) {
    }
    
    @IBAction func instantSaleSwitch(_ sender: Any) {
    }
    
    @IBAction func unlockOncePurchasedSwitch(_ sender: Any) {
    }
    
    @IBAction func createCollection(_ sender: Any) {
    }
    
    @IBAction func createItem(_ sender: Any) {
        print(itemNameText.text!)
        print(descriptionText.text!)
        print(priceText.text!)
        postRequest(name: itemNameText.text!, description: descriptionText.text!, price: priceText.text!, address: "", privateKey: "")
        performSegue(withIdentifier: "createToNotificationSegue", sender: self)
    }
    
    @IBAction func NFTLandButton(_ sender: Any) {
    }
    
    @IBAction func infoButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

}
