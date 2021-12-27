//
//  previewUploadedItemViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class previewUploadedItemViewController: UIViewController {

    
    
    //var
    var item2 = Item(itemName: "", description: "", details:  [""], instantSalePrice: "", auctionEntrancePrice: "", instantSale: false, auctionSale: false, time: "")
    var itemImage2 = UIImage(named: "")
  
    
    
    //iboutlets
    
    @IBOutlet weak var propritiesLabel: UILabel!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var mintshape: UIButton!
    
    @IBOutlet weak var assetImage: UIImageView!
    
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemDescription: UILabel!
    
    @IBOutlet weak var saleState: UILabel!
    //ibactions
   
    @IBAction func exitButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func mintButton(_ sender: Any) {
        performSegue(withIdentifier: "perviewToStepsSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mintshape.layer.cornerRadius = 20
        assetImage.image = itemImage2
        itemDescription.text = item2.description
        sizeLabel.text = item2.details[0]
        propritiesLabel.text = item2.details[1]
        itemName.text = item2.itemName + " :"
        if item2.instantSale {
           itemPrice.text = item2.instantSalePrice + " ETH"
            saleState.text = "Instant sale please verify the item price before continuing"
        }else{
            itemPrice.text = item2.auctionEntrancePrice + " ETH"
            saleState.text = "Auction Sale please verify the  auction entry price before continuing"
        }
        AssetsBrain.sellingState(item: item2, Price: itemPrice.text!, state: saleState.text!)
        
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "perviewToStepsSegue" {
            let destination = segue.destination as! stepsToUploadViewController
            destination.state[0] = false
            destination.state[1] = true
            destination.item3 = item2
            destination.itemImage3 = itemImage2
            
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
