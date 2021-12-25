//
//  uploadItemViewController.swift
//  nft
//
//  Created by wajih on 11/15/21.
//

import UIKit

class uploadItemViewController: UIViewController {

    
    //var
    
    
    @IBOutlet weak var cancelshape: UIButton!
    
    @IBOutlet weak var confirmShape: UIButton!
    
    
    
    
    
    //iboutlets
    
    @IBOutlet weak var gasfeeText: UILabel!
    
    @IBOutlet weak var gaspricetext: UITextField!
    
    @IBOutlet weak var gaslimitprice: UITextField!
    //ibactions
    
    @IBAction func confirmButton(_ sender: Any) {
        performSegue(withIdentifier: "mintToStepsSegue", sender: self)
        print(gaspricetext.text!)
        print(gaslimitprice.text!)
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mintToStepsSegue" {
            let destination = segue.destination as! stepsToUploadViewController
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
