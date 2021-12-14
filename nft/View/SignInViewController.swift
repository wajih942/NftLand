//
//  SignInViewController.swift
//  nft
//
//  Created by wajih on 11/28/21.
//

import UIKit

class SignInViewController: UIViewController,UITextFieldDelegate {
    
    //var
   var info = CustomerLogin(CustomerId: "", token: "")
   var userInfo = UserInfo(name: "", wallet_address: "", bio: "", url: "")
    
    
    //iboutlets
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var TryAgainLabel: UILabel!
    //ibactions
    
    @IBAction func ForgetPasswordButton(_ sender: Any) {
    }
    
    @IBAction func LoginButton(_ sender: Any) {
     
        postRequest(email: emailTextField.text!, password: passwordTextField.text!)
        if info.token == nil{
            TryAgainLabel.text = "Try Again"
            
        }else{
            getInfo(url: "http://localhost:3001/customers", id: info.CustomerId!, token: info.token!)
            performSegue(withIdentifier: "SignInToProfileSegue", sender: self)
        }
        
        
            
        }
    //functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
       
        return true
    }
    
    //struct
    struct CustomerLogin : Decodable {
        let CustomerId:String?
        let token:String?
    }
    struct UserInfo: Decodable{
        let name: String?
        let wallet_address:String?
        let bio:String?
        let url:String?
    }
    //post function
    func postRequest (email:String ,password:String) {
        
        guard let url = URL(string: "http://localhost:3001/customers/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
       request.setValue("application/json", forHTTPHeaderField: "content-type")//applicationjson indicates that we want to get back results in json
        //if we want to use a post we should put the request in the body of the request
       let body:[String:Any] = [
            "email": email,
            "password" : password,
           
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
                
                self.info = self.parseJSON(customerLogin: data)!
                
                
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
   
    func parseJSON(customerLogin:Data) ->CustomerLogin?  {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CustomerLogin.self,from: customerLogin)
            return decodedData
        }catch{
            print(error)
            return nil
            
    
    }
    }
    func parseJSON(userInfo:Data) ->UserInfo?  {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(UserInfo.self,from: userInfo)
            return decodedData
        }catch{
            print(error)
            return nil
            
    
    }
    }
    func getInfo(url:String,id:String,token:String) {
       
        guard let url1 = URL(string: "\(url)/\(id)") else { return }
        var request = URLRequest(url: url1)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
       //request.setValue("application/json", forHTTPHeaderField: "content-type")
        let semaphore = DispatchSemaphore(value: 0)
      let task = URLSession.shared.dataTask(with: request) {(data,response,error) in
            
            if let error = error {
                print("an error happen",error)
                return
            }
            if let data = data
            {
                self.userInfo = self.parseJSON(userInfo: data)!
                
                print(self.userInfo.wallet_address!)
                print(self.userInfo.name!)
                print(self.userInfo.bio!)
                print(self.userInfo.url!)
                
                /*do {
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []){
                        
                        print(json)
                    }
                } catch let error  {
                    print("we couldn t parse data into json ",error)
                }*/
            }
          semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignInToProfileSegue" {
            let destination = segue.destination as! visitProfileViewController
            
            destination.profile.WalletAddress = userInfo.wallet_address!
            destination.profile.DisplayName = userInfo.name!
            destination.profile.Bio = userInfo.bio!
            destination.profile.CustomUrl = userInfo.url!
            destination.token1 = info.token!
            destination.id1 = info.CustomerId!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
