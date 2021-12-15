//
//  scanQrViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class scanQrViewController: UIViewController {

    
    //var
    
    
    
    //iboutlets
    
    
    @IBOutlet weak var addressText: UITextField!
    
    @IBOutlet weak var privateKey: UITextField!
    
    //ibactions
    
   
    @IBOutlet weak var burgerButton: UIButton!
    
 
    @IBAction func connectWallet(_ sender: Any) {
        
        performSegue(withIdentifier: "scanToBurgerSegue", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "scanToBurgerSegue" {
               let destination = segue.destination as! notificationClickedViewController
               var state = "Wallet Connected"
               destination.address1 = addressText.text!
               destination.privateKey1 = privateKey.text!
               destination.state = state
           }
       }
    
    @IBAction func connectYourWalletButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func qrCodeButton(_ sender: Any) {
    }
    
    @IBAction func NFTLand(_ sender: Any) {
    }
    @IBAction func infoButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
