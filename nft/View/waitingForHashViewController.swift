//
//  waitingForHashViewController.swift
//  nft
//
//  Created by wajih on 1/1/22.
//

import UIKit

class waitingForHashViewController: UIViewController {
    
    
    
    let defaults = UserDefaults.standard

    //vars
    var profile2 = UserInfo(_id: "", name: "", wallet_address: "", bio: "", url: "", profile_picture: "", couverture_picture: "", email: "", password: "")
    var response = MarketSaleResponse(err: "", txHash: "")
    @IBOutlet weak var continueShape: UIButton!
    
    
    @IBOutlet weak var cancelshape: UIButton!
    
    //iboutlets
    
    
    
    
    //ibactions
    
    @IBAction func cancelButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var textfield: UITextView!
    
    @IBAction func continueButton(_ sender: Any) {
        performSegue(withIdentifier: "afterbuyingtoprofileSegue", sender: self)
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "afterbuyingtoprofileSegue" {
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
        continueShape.layer.cornerRadius = 20
        cancelshape.layer.cornerRadius = 20
        textfield.text = response.txHash!
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
