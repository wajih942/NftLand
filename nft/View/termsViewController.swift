//
//  termsViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class termsViewController: UIViewController {

    
    //var
    
    
    //iboutlets
    
    @IBOutlet weak var getstartedshape: UIButton!
    
    //ibactions
    
    
    @IBAction func burgerButton(_ sender: Any) {
    }
    
    @IBAction func connectYourWalletButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        performSegue(withIdentifier: "termsToProfileSegue", sender: self)
    }
    
    @IBAction func getStartedButton(_ sender: Any) {
        performSegue(withIdentifier: "termsToQrSegue", sender: self)
    }
    
    @IBAction func NFTLandButton(_ sender: Any) {
    }
    
    @IBAction func InfoButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getstartedshape.layer.cornerRadius = 20
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
