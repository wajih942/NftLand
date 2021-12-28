//
//  uploadItemViewController.swift
//  nft
//
//  Created by wajih on 11/15/21.
//

import UIKit

class uploadItemViewController: UIViewController {

    
    //var
    let defaults = UserDefaults.standard
    var item4 = Item(itemName: "", description: "", details:  [""], instantSalePrice: "", auctionEntrancePrice: "", instantSale: false, auctionSale: false, time: "")
    var itemImage4 = UIImage(named: "")
    var response = MintResponse(err: "", txHash: "", result: "")
    
    @IBOutlet weak var cancelshape: UIButton!
    
    @IBOutlet weak var confirmShape: UIButton!
    
    
    
    
    
    //iboutlets
    
    @IBOutlet weak var gasfeeText: UILabel!
    
    @IBOutlet weak var gaspricetext: UITextField!
    
    @IBOutlet weak var gaslimitprice: UITextField!
    //ibactions
    
    @IBAction func confirmButton(_ sender: Any) {
        
        if let info =  defaults.array(forKey: "info") as? [String]{
            print(info[0])
            print(info[1])
            
           response = AssetsBrain.uploadImage(item: item4, paramName: "image", fileName: "image", image: itemImage4!,address: info[0],privateKey: info[1],gasLimit: gaslimitprice.text!,gasPrice: gaspricetext.text!)
        }
        
        print(response.txHash)
        print(response.result)
        print(response.err)
        performSegue(withIdentifier: "mintToStepsSegue", sender: self)
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mintToStepsSegue" {
            let destination = segue.destination as! stepsToUploadViewController
            
            destination.response2 = response
            destination.item3 = item4
            destination.state[0] = false
            destination.state[1] = false
            destination.state[2] = true
            
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelshape.layer.cornerRadius = 20
        confirmShape.layer.cornerRadius = 20
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
