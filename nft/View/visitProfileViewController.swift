//
//  visitProfileViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit
import SideMenu
class visitProfileViewController: UIViewController,MenuControllerDelegate {
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion:{[weak self] in
            if named == "Connect My Wallet"
            {
            
                
            }else if named == "Settings" {
                
            }else if named == "Log Out" {
               
            }
        })
    }
    private let wallet = connectWalletViewController()
    private let logout = SignInViewController()

    //struct
    private func addChildControllers(){
        addChild(wallet)
        addChild(logout)
        view.addSubview(wallet.view)
        view.addSubview(logout.view)
        
        wallet.view.frame = view.bounds
        logout.view.frame = view.bounds
        
        wallet.didMove(toParent: self)
        logout.didMove(toParent: self)
        
        wallet.view.isHidden = true
        logout.view.isHidden = true
    }
    
    var profile = Account(WalletAddress: "", DisplayName: "", CustomUrl: "", Bio: "", Portfolio: "", Password: "")
    var token1 = ""
    var id1 = ""
    private var  sideMenu : UISideMenuNavigationController?
    //iboutlet
    
    @IBOutlet weak var LabelName: UILabel!
    
    @IBOutlet weak var AddressLabel: UILabel!
    
    @IBOutlet weak var BioLabel: UILabel!
    
    @IBOutlet weak var UrlLabel: UILabel!
    //ibaction
    
    @IBAction func notificationButton(_ sender: Any) {
    }
    
    
    @IBAction func profileButton(_ sender: Any) {
    }
    
    @IBAction func burgerButton(_ sender: Any) {
        present(sideMenu!,animated: true)
    }
    
    @IBAction func editCoverButton(_ sender: Any) {
    }
    @IBAction func editProfileButton(_ sender: Any) {
    }
    @IBAction func followButton(_ sender: Any) {
    }
    @IBAction func uploadButton(_ sender: Any) {
    }
    @IBAction func plusButton(_ sender: Any) {
    }
    @IBAction func twitterButton(_ sender: Any) {
    }
    @IBAction func instagramButton(_ sender: Any) {
    }
    @IBAction func facebookButton(_ sender: Any) {
    }
    
    @IBAction func NFTLandButton(_ sender: Any) {
    }
    
    @IBAction func infoButton(_ sender: Any) {
    }
    //functions
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProfileToEditSegue" {
            let destination = segue.destination as! EditProfileViewController
            AccountBrain.copyAccount(account1: destination.edit , account2: profile)
            destination.token2 = token1
            destination.id2 = id1
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuController(with: ["Connect My Wallet", "Settings","Log Out"])
        menu.delegate = self
        LabelName.text = profile.DisplayName
        AddressLabel.text = profile.WalletAddress
        BioLabel.text = profile.Bio
        UrlLabel.text = profile.CustomUrl
        print(profile.DisplayName)
        sideMenu = UISideMenuNavigationController(rootViewController: menu)
        SideMenuManager.default.menuRightNavigationController = sideMenu
        SideMenuManager.default.menuAddPanGestureToPresent(toView: view)
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
