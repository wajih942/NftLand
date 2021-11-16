//
//  previewUploadedItemViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class previewUploadedItemViewController: UIViewController {

    
    
    //var
    
    
    
    //iboutlets
    
    
    @IBOutlet weak var assetImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var highestBidLabel: UILabel!
    
    //ibactions
    
    @IBAction func exitButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
