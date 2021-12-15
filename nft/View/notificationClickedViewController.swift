//
//  notificationClickedViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class notificationClickedViewController: UIViewController {

    //var
    var privateKey1:String?
    var address1:String?
    var state = "Connect To Wallet"
    
    
    //iboutlet
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var walletStateLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var walletAddressButton: UILabel!
    
    
    //ibactions
    
    @IBAction func manageFunds(_ sender: Any) {
    }
    
    @IBAction func profileButton(_ sender: Any) {
    }
    
    @IBAction func itemsButton(_ sender: Any) {
    }
    
    @IBAction func darkThemeButton(_ sender: Any) {
    }
    
    @IBAction func Disconnect(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        walletAddressButton.text = address1
        walletStateLabel.text = state
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "notificationToUploadSegue" {
               let destination = segue.destination as! addItemViewController
               
               destination.address2 = address1!
               destination.privatekey2 = privateKey1!
               
           }
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
