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
