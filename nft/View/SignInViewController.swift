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
    var userInfo = UserInfo(_id : "",name: "", wallet_address: "", bio: "", url: "", profile_picture: "", couverture_picture: "", email: "", password: "")
    
    var code = Reset(Token: "")
    //iboutlets
    
    @IBOutlet weak var loginbuttonshape: UIButton!
    
    @IBOutlet weak var forgetpasswordbuttonshape: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var TryAgainLabel: UILabel!
    //ibactions
    
    @IBAction func ForgetPasswordButton(_ sender: Any) {
        
        
        if emailTextField.text! == "" {
            let alert = UIAlertController(title: "Empty Email", message: "Please Enter Your Email", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok" , style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert,animated: true)
        }else{
            code = AccountBrain.resetPassword(email: emailTextField.text!)
            performSegue(withIdentifier: "signInToResetPassword ", sender: self)
        }
        
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
     
            info = AccountBrain.postRequest(email: emailTextField.text!, password: passwordTextField.text!) 
        if info.token == nil{
            let alert = UIAlertController(title: "Login failed", message: "Please try again ", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok" , style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert,animated: true)
            
            
        }else{
              userInfo = AccountBrain.getInfo(url: "http://localhost:3001/customers", id: info.CustomerId!, token: info.token!)
            performSegue(withIdentifier: "SignInToProfileSegue", sender: self)
        }
        
        
            
        }
    //functions
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
       
        return true
    }
    
    
    
   
    
    
    
    
    
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignInToProfileSegue" {
            let destination = segue.destination as! visitProfileViewController
            destination.info2 = info
            destination.profile = userInfo
        }
     if segue.identifier == "signInToResetPassword " {
         let destination = segue.destination as! ResetViewController
         destination.email = emailTextField.text!
         destination.token = code
     }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        viewWillDisappear(true)
        loginbuttonshape.layer.cornerRadius = 20
        forgetpasswordbuttonshape.layer.cornerRadius = 20
        
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
