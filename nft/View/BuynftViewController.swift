//
//  BuynftViewController.swift
//  nft
//
//  Created by wajih on 1/1/22.
//

import UIKit

class BuynftViewController: UIViewController {

    //vars
    let defaults = UserDefaults.standard
    var info = Meta(tokenId: "", seller: "", owner: "", price: "", name: "", description: "", image: "")
    var response = MarketSaleResponse(err: "", txHash: "")
    
    
    //iboutlets
    @IBOutlet weak var cancelshape: UIButton!
    
    @IBOutlet weak var itemPricelabel: UILabel!
    
    @IBOutlet weak var confirmshape: UIButton!
    
    @IBOutlet weak var gaspricetextfield: UITextField!
    
    
    @IBOutlet weak var gaslimittextfield: UITextField!
    
    //ibactions
    
    
    @IBAction func confirmButton(_ sender: Any) {
        
        if let info2 =  defaults.array(forKey: "info") as? [String]{
            print(info2[0])
            print(info2[1])
            response = AssetsBrain.buyNft(token: info.tokenId!, price: info.price!, address: info2[0], privateKey: info2[1], gasLimit: gaslimittextfield.text!, gasPrice: gaspricetextfield.text!)
            performSegue(withIdentifier: "buyToWaitSegue", sender: self)
        }
        print(info)

        
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "buyToWaitSegue" {
                let destination = segue.destination as! waitingForHashViewController
                destination.response = response
                
                
            }
            
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelshape.layer.cornerRadius = 20
        confirmshape.layer.cornerRadius = 20
        itemPricelabel.text = info.price! + " ETH"
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


    
    
