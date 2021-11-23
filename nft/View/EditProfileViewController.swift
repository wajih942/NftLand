//
//  EditProfileViewController.swift
//  nft
//
//  Created by wajih on 11/22/21.
//

import UIKit

class EditProfileViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate  {

    //var
    
    var edit = Account(WalletAddress: "", DisplayName: "", CustomUrl: "", Bio: "", Portfolio: "", Password: "")
    
    
    //iboutlets
    
    
  
    @IBOutlet weak var DisplayNameTextField: UITextField!
    @IBOutlet weak var CustomUrlSessionTextField: UITextField!
    @IBOutlet weak var BioTextView: UITextView!
    @IBOutlet weak var PortfolioTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    //ibactions
    @IBAction func BackToProfileButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func UploadButton(_ sender: Any) {
    }
    
    @IBAction func AddSocialButton(_ sender: Any) {
    }
    
    
    @IBAction func UpdateButton(_ sender: Any) {
        edit = Account(WalletAddress: "0000000000000000000000", DisplayName: DisplayNameTextField.text!, CustomUrl: CustomUrlSessionTextField.text!, Bio: BioTextView.text!, Portfolio: PortfolioTextField.text!, Password: PasswordTextField.text!)
        
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
            AccountBrain.copyAccount(account1: destination.profile , account2: edit)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayNameTextField.delegate = self
        CustomUrlSessionTextField.delegate = self
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
