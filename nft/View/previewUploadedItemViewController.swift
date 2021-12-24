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
    
    
    @IBOutlet weak var mintshape: UIButton!
    
    @IBOutlet weak var assetImage: UIImageView!
    
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemDescription: UILabel!
    
    @IBOutlet weak var saleState: UILabel!
    //ibactions
   
    
    @IBAction func mintButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mintshape.layer.cornerRadius = 20
        assetImage.image = itemImage2
        itemPrice.text = item2.auctionEntrancePrice + "ETH"
        itemDescription.text = item2.description
        saleState.text = item2.time
        
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
