//
//  ResetViewController.swift
//  nft
//
//  Created by wajih on 12/30/21.
//

import UIKit

class ResetViewController: UIViewController {
    
    //vars 
    var token = Reset(Token: "wajih")
    var email = ""
    
    @IBOutlet weak var continueshape: UIButton!
    //iboutlets
    @IBOutlet weak var codeTextfield: UITextField!
    
    @IBOutlet weak var anotheremailshape: UIButton!
    //ibactions
    @IBAction func continueButton(_ sender: Any) {
        let res = AccountBrain.conforme(code: codeTextfield.text!, token: token.Token!)
        if res {
            performSegue(withIdentifier: "emailtonewpassordSegue", sender: self)
        }
        else{
            let alert = UIAlertController(title: "Wrong code", message: "Please try again ", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok" , style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert,animated: true)
        }
    }

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "emailtonewpassordSegue" {
               let destination = segue.destination as! NewPasswordViewController
               
               destination.token = token
               
           }
       }
    @IBAction func sendanothetButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        continueshape.layer.cornerRadius = 20
        anotheremailshape.layer.cornerRadius = 20
        print(token)
        
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
