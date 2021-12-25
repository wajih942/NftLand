//
//  notificationClickedViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class notificationClickedViewController: UIViewController {

    //var
    let defaults = UserDefaults.standard
    
    
    
    //iboutlet
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var walletStateLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var walletAddressButton: UILabel!
    
    
    //ibactions
    
    @IBAction func ConnectwalletButton(_ sender: Any) {
        performSegue(withIdentifier: "functionalitiesToTermsSegue", sender: self)
    }
    @IBAction func returnButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func manageFunds(_ sender: Any) {
    }
    
    @IBAction func profileButton(_ sender: Any) {
        performSegue(withIdentifier: "functionalitiesToProfileSegue", sender: self)
    }
    
    @IBAction func itemsButton(_ sender: Any) {
        performSegue(withIdentifier: "functionalitiesToStepsSegue", sender: self)
    }
    
    @IBAction func darkThemeButton(_ sender: Any) {
    }
    
    @IBAction func Disconnect(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let info =  defaults.array(forKey: "info") as? [String]{
            balanceLabel.text = "get req"
            walletAddressButton.text = info[0]
            walletStateLabel.text = "wallet connected"
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
