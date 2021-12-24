//
//  connectWalletViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class connectWalletViewController: UIViewController {

    //var
    let defaults = UserDefaults.standard
    var walletinfo = ["wallet address", "private key"]
    //iboutlets
    
    @IBOutlet weak var connectShape: UIButton!
    
    @IBOutlet weak var privateKeyText: UITextField!
    
    
    //ibactions
  
    @IBAction func burgerButton(_ sender: Any) {
        performSegue(withIdentifier: "privateToFunctionalitiesSegue", sender: self)
    }
    
    @IBAction func returnButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func connectButton(_ sender: Any) {
        if let info =  defaults.array(forKey: "info") as? [String]{
            walletinfo[0] = info[0]
            walletinfo[1] = privateKeyText.text!
            defaults.set(walletinfo,forKey: "info")
        }
        performSegue(withIdentifier: "privateToFunctionalitiesSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectShape.layer.cornerRadius = 20
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
