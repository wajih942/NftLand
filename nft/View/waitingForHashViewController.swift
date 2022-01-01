//
//  waitingForHashViewController.swift
//  nft
//
//  Created by wajih on 1/1/22.
//

import UIKit

class waitingForHashViewController: UIViewController {

    //vars
    
    
    @IBOutlet weak var continueShape: UIButton!
    
    
    @IBOutlet weak var cancelshape: UIButton!
    
    //iboutlets
    
    
    
    
    //ibactions
    
    @IBAction func cancelButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func continueButton(_ sender: Any) {
        performSegue(withIdentifier: "afterbuyingtoprofileSegue", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueShape.layer.cornerRadius = 20
        cancelshape.layer.cornerRadius = 20
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
