//
//  NewPasswordViewController.swift
//  nft
//
//  Created by wajih on 12/30/21.
//

import UIKit

class NewPasswordViewController: UIViewController {

    
    var token = Reset(Token: "")
    var email = ""
    var res = NewPasswordResponse(response: "")
    @IBOutlet weak var password1textfield: UITextField!
    
    @IBOutlet weak var continueshape: UIButton!
    
    @IBOutlet weak var confirmpasswordtextfield: UITextField!
    
    
    @IBAction func continueButton(_ sender: Any) {
        
        
        if password1textfield.text! == confirmpasswordtextfield.text! {
            
            if password1textfield.text! == "" {
                let alert = UIAlertController(title: "Empty Password", message: "Please Enter a Password", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok" , style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert,animated: true)
            }else{
                
                res = AccountBrain.newPassword(password: password1textfield.text!, id: token.Token!)
                performSegue(withIdentifier: "returnTosigninsegue", sender: self)
            }
        }else{
            let alert = UIAlertController(title: "diffrent passwords", message: "password and confirm password are different", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok" , style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert,animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        continueshape.layer.cornerRadius = 20
        print(token)
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
