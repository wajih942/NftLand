//
//  visitProfileViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit
import SideMenu
class visitProfileViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    //struct
    
    
    var profile = Account(WalletAddress: "", DisplayName: "", CustomUrl: "", Bio: "", email: "", Password: "")
    var token1 = ""
    var id1 = ""
    var profileImage = UIImage(named: "")
    private var  sideMenu : UISideMenuNavigationController?
    //iboutlet
    
    
    @IBOutlet weak var onsaleShape: UIButton!
    
    @IBOutlet weak var purshasedshape: UIButton!

    
    @IBOutlet weak var smallImage: UIImageView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    
    
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var LabelName: UILabel!
    
    @IBOutlet weak var AddressLabel: UILabel!
    
    @IBOutlet weak var BioLabel: UILabel!
    
    @IBOutlet weak var UrlLabel: UILabel!
    //ibaction
    
    
    
    @IBAction func onSaleButton(_ sender: Any) {
        onsaleShape.backgroundColor = UIColor.black
        onsaleShape.tintColor = UIColor.white
        
        purshasedshape.backgroundColor = UIColor.white
        purshasedshape.tintColor = UIColor.black
    }
    @IBAction func notificationButton(_ sender: Any) {
        performSegue(withIdentifier: "profileToNotifSegue", sender: self)
    }
   
    
    @IBAction func purchasedButton(_ sender: Any) {
        purshasedshape.backgroundColor = UIColor.black
        purshasedshape.tintColor = UIColor.white
        onsaleShape.backgroundColor = UIColor.white
        onsaleShape.tintColor = UIColor.black
        
    }
    
    
    
    @IBAction func burgerButton(_ sender: Any) {
        performSegue(withIdentifier: "profileToFunctionalitiesSegue", sender: self)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            coverImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func editCoverButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
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
           /*AccountBrain.copyAccount(account1: destination.edit , account2: profile)*/
            destination.token2 = token1
            destination.id2 = id1
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelName.text = profile.DisplayName
        AddressLabel.text = profile.WalletAddress
        BioLabel.text = profile.Bio
        UrlLabel.text = profile.CustomUrl
        navigationController?.setNavigationBarHidden(true, animated: true)
        profileImageView.image = profileImage
        profileImageView.layer.cornerRadius = 70
        smallImage.layer.cornerRadius = 20
        smallImage.image = profileImage
        
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
