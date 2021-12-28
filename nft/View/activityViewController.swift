//
//  activityViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class activityViewController: UIViewController {

    //var
    
    
    
    
    
    //iboutlets
    
    @IBOutlet weak var activityshape: UIButton!
    
    
    @IBOutlet weak var followingshape: UIButton!
    
    @IBOutlet weak var allshape: UIButton!
    
    //ibactions
    
    
  
    @IBAction func burgerButton(_ sender: Any) {
        performSegue(withIdentifier: "activityTofunctionSegue", sender: self)
    }
    
    @IBAction func profileButton(_ sender: Any) {
    }
    
    @IBAction func notificationButton(_ sender: Any) {
        performSegue(withIdentifier: "activityToNotificationSegue", sender: self)
    }
    
    @IBAction func allActivityButton(_ sender: Any) {
        allshape.backgroundColor = UIColor.systemBlue
        allshape.tintColor = UIColor.white
        followingshape.backgroundColor = UIColor.white
        followingshape.tintColor = UIColor.black
        activityshape.backgroundColor = UIColor.white
        activityshape.tintColor = UIColor.black
    }
    @IBAction func followingButton(_ sender: Any) {
        followingshape.backgroundColor = UIColor.systemBlue
        followingshape.tintColor = UIColor.white
        activityshape.backgroundColor = UIColor.white
        activityshape.tintColor = UIColor.black
        allshape.backgroundColor = UIColor.white
        allshape.tintColor = UIColor.black
    }
    @IBAction func MyActivityButton(_ sender: Any) {
        activityshape.backgroundColor = UIColor.systemBlue
        activityshape.tintColor = UIColor.white
        followingshape.backgroundColor = UIColor.white
        followingshape.tintColor = UIColor.black
        allshape.backgroundColor = UIColor.white
        allshape.tintColor = UIColor.black
        
        
    }
    @IBAction func backToHomeButton(_ sender: Any) {
    }
    
    @IBAction func filterButton(_ sender: Any) {
    }
    
    @IBAction func NFTLandButton(_ sender: Any) {
    }
    
    @IBAction func infoButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activityshape.layer.cornerRadius = 15
        followingshape.layer.cornerRadius = 15
        allshape.layer.cornerRadius = 15
        followingshape.backgroundColor = UIColor.white
        followingshape.tintColor = UIColor.black
        allshape.backgroundColor = UIColor.white
        allshape.tintColor = UIColor.black
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
