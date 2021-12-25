//
//  MarketSaleViewController.swift
//  nft
//
//  Created by wajih on 12/25/21.
//

import UIKit

class MarketSaleViewController: UIViewController {

    
    //vars
    
    //iboutlets
    
    @IBOutlet weak var cancelshape: UIButton!
    
    @IBOutlet weak var confirmshape: UIButton!
    
    @IBOutlet weak var listingfeelabel: UILabel!
    
    
    @IBOutlet weak var gasfeelabel: UILabel!
    
    @IBOutlet weak var gaspricetext: UITextField!
    
    @IBOutlet weak var gaslimittext: UITextField!
    //ibactions
    
    @IBAction func cancelButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func confirmButton(_ sender: Any) {
        performSegue(withIdentifier: "marketsaleToActivitySegue", sender: self)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelshape.layer.cornerRadius = 20
        confirmshape.layer.cornerRadius = 20
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
