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
    
    //iboutlets
    
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
        start1shape.layer.cornerRadius = 20
        start2shape.layer.cornerRadius = 20
        start3shape.layer.cornerRadius = 20
        start1shape.isEnabled = state[0]
        start2shape.isEnabled = state[1]
        start3shape.isEnabled = state[2]
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stepsToMintSegue" {
            let destination = segue.destination as! uploadItemViewController
            
            destination.item4 = item3
            destination.itemImage4 = itemImage3
            
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
