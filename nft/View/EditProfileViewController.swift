//
//  EditProfileViewController.swift
//  nft
//
//  Created by wajih on 11/22/21.
//

import UIKit

class EditProfileViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate & UINavigationControllerDelegate  {

    //var
    
    var edit = Account(WalletAddress: "", DisplayName: "", CustomUrl: "", Bio: "", email: "", Password: "")
    var token2 = ""
    var id2 = ""
    
    //iboutlets
    
    
  
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var DisplayNameTextField: UITextField!
    @IBOutlet weak var CustomUrlSessionTextField: UITextField!
    @IBOutlet weak var BioTextView: UITextView!
    @IBOutlet weak var PortfolioTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    //ibactions
    
    @IBAction func notificationButton(_ sender: Any) {
        performSegue(withIdentifier: "EditToNotifSegue", sender: self)
    }
    
    
    @IBAction func BurgerButton(_ sender: Any) {
        performSegue(withIdentifier: "editToFunctionSegue", sender: self)
    }
    
    
    @IBAction func BackToProfileButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func UploadButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
    
    @IBAction func AddSocialButton(_ sender: Any) {
    }
    
    
    @IBAction func UpdateButton(_ sender: Any) {
        edit = Account(WalletAddress: "0000000000000000000000", DisplayName: DisplayNameTextField.text!, CustomUrl: CustomUrlSessionTextField.text!, Bio: BioTextView.text!, email: "", Password: "")
        performRequest(account: edit, token: token2, id: id2)
    
        
    }
    
    @IBAction func ClearAllButton(_ sender: Any) {
        DisplayNameTextField.text = ""
        CustomUrlSessionTextField.text = ""
        BioTextView.text = ""
        PortfolioTextField.text = ""
        PasswordTextField.text = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        DisplayNameTextField.endEditing(true)
        CustomUrlSessionTextField.endEditing(true)
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
        if segue.identifier == "EditToProfileSegue" {
            let destination = segue.destination as! visitProfileViewController
            destination.profile = edit
            destination.profileImage = profileImage.image
        }
    }
    //functions
    func performRequest(account : Account,token : String , id : String) {
        guard let url = URL(string: "http://localhost:3001/customers/\(id)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
       request.setValue("application/json", forHTTPHeaderField: "content-type")//applicationjson indicates that we want to get back results in json
        //if we want to use a post we should put the request in the body of the request
       let body:[String:Any] = [
            "wallet_address": account.WalletAddress,
            "name" : account.DisplayName,
            "url": account.CustomUrl,
            "bio":account.Bio,
            "email":account.email,
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
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayNameTextField.delegate = self
        CustomUrlSessionTextField.delegate = self
        PortfolioTextField.delegate = self
        
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
