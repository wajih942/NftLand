//
//  SignUpViewController.swift
//  nft
//
//  Created by wajih on 11/21/21.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    //var
    var account = Account(WalletAddress: "0000000000000000000000", DisplayName: "", CustomUrl: "", Bio: "", email: "", Password: "")

    
    
    //iboutlets
    
    
    @IBOutlet weak var signupshape: UIButton!
    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBOutlet weak var DisplayNameTextField: UITextField!
    
    @IBOutlet weak var CustomUrlTextField: UITextField!
    
    @IBOutlet weak var BioTextView: UITextView!
    
    @IBOutlet weak var emailtextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    //ibactions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            ProfileImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func UploadButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
    
    @IBAction func AddSocialMediaAccountButton(_ sender: Any) {
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        print(DisplayNameTextField.text!)
        print(CustomUrlTextField.text!)
        print(BioTextView.text!)
        print(emailtextField.text!)
        print(PasswordTextField.text!)
        account = Account(WalletAddress: "0000000000000000000000", DisplayName: DisplayNameTextField.text!, CustomUrl: CustomUrlTextField.text!, Bio: BioTextView.text!, email: emailtextField.text!, Password: PasswordTextField.text!)
        
        
        if AccountBrain.inputValidation(account: account, self: self,image: ProfileImageView.image) {
            AccountBrain.uploadWithImage(account: account, image: ProfileImageView.image!)
            performSegue(withIdentifier: "signupToProfileSegue", sender: self)
            
        }
        
        //
    }
    
    @IBAction func ClearAllButton(_ sender: Any) {
        DisplayNameTextField.text = ""
        CustomUrlTextField.text = ""
        BioTextView.text = ""
        emailtextField.text = ""
        PasswordTextField.text = ""
    }
    
    
    //functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        DisplayNameTextField.endEditing(true)
        CustomUrlTextField.endEditing(true)
        emailtextField.endEditing(true)
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
        if segue.identifier == "signupToProfileSegue" {
            let destination = segue.destination as! visitProfileViewController
            destination.profile = account
            destination.profileImage = ProfileImageView.image!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayNameTextField.delegate = self
        CustomUrlTextField.delegate = self
        emailtextField.delegate = self
        PasswordTextField.delegate = self
        BioTextView.delegate = self
        signupshape.layer.cornerRadius = 20
        ProfileImageView.layer.cornerRadius = 37
        
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

