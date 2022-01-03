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
    var profile2 =  UserInfo(_id : "",name: "", wallet_address: "", bio: "", url: "", profile_picture: "", couverture_picture: "", email: "", password: "")
    
    var userinfo1 = [String]()
    //iboutlet
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var walletStateLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var walletAddressButton: UILabel!
    
    
    
    //ibactions
    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier: "functionalitiestoshearchSegue", sender: self)
        
    }
    
    
    
    @IBAction func hallButton(_ sender: Any) {
        performSegue(withIdentifier: "functionalitiesTohallSegue", sender: self)
    }
    @IBAction func ConnectwalletButton(_ sender: Any) {
        performSegue(withIdentifier: "functionalitiesToTermsSegue", sender: self)
    }
    @IBAction func returnButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
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
        var userinfo = ["","","","","","","","",""]
        defaults.set(userinfo,forKey: "user")
        performSegue(withIdentifier: "deconnectSegue1", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "functionalitiesToProfileSegue" {
            let destination = segue.destination as! visitProfileViewController
            if let user =  defaults.array(forKey: "user") as? [String]{
                profile2 = UserInfo(_id: user[0], name: user[1], wallet_address: user[2], bio: user[3], url: user[4], profile_picture: user[5], couverture_picture: user[6], email: user[7], password: user[8])
                print(profile2)
                print(user)
            }
            
            
           
            
           destination.profile = profile2
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let info =  defaults.array(forKey: "info") as? [String]{
            
            walletAddressButton.text = info[0]
            walletStateLabel.text = "wallet connected"
            DispatchQueue.main.async {
                // Create Image and Update Image View
                self.balanceLabel.text = AccountBrain.getBalance(address: info[0]).balance! + " ETH"
                
            }
            
        }
        if let user =  defaults.array(forKey: "user") as? [String]{
            userNameLabel.text = user[1]
            print(user)
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
