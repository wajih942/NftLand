//
//  connectWalletViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class connectWalletViewController: UIViewController {

    //var
    
    
    //iboutlets
    
    
    
    
    //ibactions
    
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func wallet1Button(_ sender: Any) {
        performSegue(withIdentifier: "walletsToQrSegue", sender: self)
    }
    
    
    @IBAction func wallet2Button(_ sender: Any) {
    }
    
    
    @IBAction func wallet3Button(_ sender: Any) {
    }
    
    @IBAction func wallet4Button(_ sender: Any) {
    }
    
    @IBAction func NFTLandButton(_ sender: Any) {
    }
    
    
    @IBAction func infoButton(_ sender: Any) {
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
