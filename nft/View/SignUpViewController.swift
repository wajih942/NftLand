//
//  SignUpViewController.swift
//  nft
//
//  Created by wajih on 11/21/21.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    //var
    var account = Account(WalletAddress: "0000000000000000000000", DisplayName: "", CustomUrl: "", Bio: "", Portfolio: "", Password: "")
    func aaa(account : Account) {
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
            "email":account.Portfolio,
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
    
    
    //iboutlets
    
    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBOutlet weak var DisplayNameTextField: UITextField!
    
    @IBOutlet weak var CustomUrlTextField: UITextField!
    
    @IBOutlet weak var BioTextView: UITextView!
    
    @IBOutlet weak var PortfolioTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    //ibactions
    
    @IBAction func UploadButton(_ sender: Any) {
    }
    
    @IBAction func AddSocialMediaAccountButton(_ sender: Any) {
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        print(DisplayNameTextField.text!)
        print(CustomUrlTextField.text!)
        print(BioTextView.text!)
        print(PortfolioTextField.text!)
        print(PasswordTextField.text!)
        account = Account(WalletAddress: "0000000000000000000000", DisplayName: DisplayNameTextField.text!, CustomUrl: CustomUrlTextField.text!, Bio: BioTextView.text!, Portfolio: PortfolioTextField.text!, Password: PasswordTextField.text!)
        aaa(account: account)
    }
    
    @IBAction func ClearAllButton(_ sender: Any) {
        DisplayNameTextField.text = ""
        CustomUrlTextField.text = ""
        BioTextView.text = ""
        PortfolioTextField.text = ""
        PasswordTextField.text = ""
    }
    
    
    //functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        DisplayNameTextField.endEditing(true)
        CustomUrlTextField.endEditing(true)
        PortfolioTextField.endEditing(true)
        PasswordTextField.endEditing(true)
        BioTextView.endEditing(true)
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
         if(text == "\n") {
             textView.resignFirstResponder()
             return false
         }
         return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpSegue" {
            let destination = segue.destination as! visitProfileViewController
            AccountBrain.copyAccount(account1: destination.profile , account2: account)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayNameTextField.delegate = self
        CustomUrlTextField.delegate = self
        PortfolioTextField.delegate = self
        PasswordTextField.delegate = self
        BioTextView.delegate = self
        
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
