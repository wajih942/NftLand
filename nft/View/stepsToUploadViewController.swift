//
//  stepsToUploadViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class stepsToUploadViewController: UIViewController {

    
    
    
    //var
    var state = [true,false,false]
    var item3 = Item(itemName: "", description: "", details:  [""], instantSalePrice: "", auctionEntrancePrice: "", instantSale: false, auctionSale: false, time: "")
    var itemImage3 = UIImage(named: "")
    var response2 = MintResponse(err: "" , txHash: "123", result: "")
    //iboutlets
    
    @IBOutlet weak var ipfsInfoLabel: UILabel!
    
    @IBOutlet weak var txhashInfoLabel: UILabel!
    
    
    @IBOutlet weak var ipfsUrlLabel: UILabel!
    
    
    
    @IBOutlet weak var txHashLabel: UILabel!
    
    @IBOutlet weak var start1shape: UIButton!
    
    @IBOutlet weak var start2shape: UIButton!
    
    @IBOutlet weak var start3shape: UIButton!
    //ibActions
   
    @IBAction func existButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func startUploadButton(_ sender: Any) {
        performSegue(withIdentifier: "stepsToCreateSegue", sender: self)
    }
    
    @IBAction func StartMint(_ sender: Any) {
        performSegue(withIdentifier: "stepsToMintSegue", sender: self)
    }
    
    @IBAction func startmaketsale(_ sender: Any) {
        performSegue(withIdentifier: "stepsToListSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(response2.err)
        print(response2.txHash!)
        start1shape.layer.cornerRadius = 20
        start2shape.layer.cornerRadius = 20
        start3shape.layer.cornerRadius = 20
        start1shape.isEnabled = state[0]
        start2shape.isEnabled = state[1]
        start3shape.isEnabled = state[2]
        if response2.err == nil  {
            start1shape.alpha = 0
            start2shape.alpha = 0
            ipfsUrlLabel.text = response2.result!
            txHashLabel.text = response2.txHash!
            txhashInfoLabel.text = "token created check the transaction hash on etherscan"
            ipfsInfoLabel.text = "your item has been stored properly on ipfs"
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stepsToMintSegue" {
            let destination = segue.destination as! uploadItemViewController
            
            destination.item4 = item3
            destination.itemImage4 = itemImage3
            
        }
        if segue.identifier == "stepsToListSegue" {
            let destination = segue.destination as! MarketSaleViewController
            if item3.instantSale {
                destination.price = item3.instantSalePrice
            }else{
                destination.price = item3.auctionEntrancePrice
            }
            destination.txhash = response2.txHash!
            
            
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
