//
//  addItemViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class addItemViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    
    
    //var
    let datePicker = UIDatePicker()
    var item = Item(itemName: "", description: "", details:  [""], instantSalePrice: "", auctionEntrancePrice: "", instantSale: false, auctionSale: false, time: "")
   /* var info = mintInfo(url: "", hash: "")
    var privatekey2 : String?
    var address2 : String?
    */
    //functions
    /*
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
    */
    //@IBOutlet weak var singleToMutipleLabel: UILabel!
    
    
    //iboutlets
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var setTime: UITextField!
    @IBOutlet weak var instantsaleswitch: UISwitch!
    @IBOutlet weak var auctionswitch: UISwitch!
    @IBOutlet weak var createshape: UIButton!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var sizetext: UITextField!
    @IBOutlet weak var itemNameText: UITextField!
  
    @IBOutlet weak var propritietext: UITextField!
    
    @IBOutlet weak var auctionPricetext: UITextField!
    
    @IBOutlet weak var instantsalePrice: UITextField!
    //ibactions
    @IBAction func notificationButton(_ sender: Any) {
    }
    @IBAction func CreateItemButton(_ sender: Any) {
        item = Item(itemName: itemNameText.text!, description: descriptionText.text!, details: [sizetext.text!,propritietext.text!], instantSalePrice: instantsalePrice.text!, auctionEntrancePrice: auctionPricetext.text!, instantSale: instantsaleswitch.isOn, auctionSale:auctionswitch.isOn,time: setTime.text!)
        print(item)
        performSegue(withIdentifier: "createToPreview", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createToPreview" {
            let destination = segue.destination as! previewUploadedItemViewController
            destination.item2 = item
            destination.itemImage2 = itemImage.image
        }
    }
    
    @IBAction func uploadItemButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
    @IBAction func profileButton(_ sender: Any) {
    }
    
    @IBAction func burgerButton(_ sender: Any) {
        performSegue(withIdentifier: "createToFunctionalitiesSegue", sender: self)
    }
    
    
    @IBAction func switchToMultipleButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func auctionSwitch(_ sender: UISwitch) {
        if sender.isOn {
            instantsaleswitch.isEnabled = false
            instantsalePrice.isEnabled = false
        }else{
            instantsaleswitch.isEnabled = true
            instantsalePrice.isEnabled = true
        }
    }
    
    
    @IBAction func instantSaleSwitch(_ sender: UISwitch) {
        if sender.isOn {
            auctionswitch.isEnabled = false
            auctionPricetext.isEnabled = false
        }else{
            auctionswitch.isEnabled = true
            auctionPricetext.isEnabled = true
        }
    }
    
    
    @IBAction func NFTLandButton(_ sender: Any) {
    }
    
    @IBAction func infoButton(_ sender: Any) {
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        itemNameText.endEditing(true)
        descriptionText.endEditing(true)
        sizetext.endEditing(true)
        propritietext.endEditing(true)
        auctionPricetext.endEditing(true)
        instantsalePrice.endEditing(true)
        setTime.endEditing(true)
        
        return true
    }
    //functions
    func createDatePicker()  {
        //toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //barButton
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(datePickerValueChanged))
        toolBar.setItems([donebtn], animated: true)
        //style
        datePicker.frame.size = CGSize(width: 0, height: 250)
        //assign toolbar
        setTime.inputAccessoryView = toolBar
        
        //assign date picker to the text field
        setTime.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .dateAndTime
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            itemImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createshape.layer.cornerRadius = 20
        instantsaleswitch.isOn = false
        auctionswitch.isOn = false
        
        itemNameText.delegate = self
        descriptionText.delegate = self
        sizetext.delegate = self
        propritietext.delegate = self
        instantsalePrice.delegate = self
        auctionPricetext.delegate = self
        setTime.delegate = self
        createDatePicker()
      
        
        // Do any additional setup after loading the view.
    }
    @objc func datePickerValueChanged(){
        // formater
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        setTime.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }

}
