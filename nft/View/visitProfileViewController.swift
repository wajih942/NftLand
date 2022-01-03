//
//  visitProfileViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit
import SideMenu
class visitProfileViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    //struct
    var fav = [Meta]()
    
    var profile =  UserInfo(_id : "",name: "", wallet_address: "", bio: "", url: "", profile_picture: "", couverture_picture: "", email: "", password: "")
    var info2 = CustomerLogin(CustomerId: "", token: "")
    var profileImage = UIImage(named: "")
    private var  sideMenu : UISideMenuNavigationController?
    //iboutlet
    let defaults = UserDefaults.standard
    
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
        
        var userinfo = [profile._id!,profile.name!,profile.wallet_address!,profile.bio!,profile.url!,profile.profile_picture!,profile.couverture_picture!,profile.email!,""]
        defaults.set(userinfo,forKey: "user")
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
            if  info2.token! == "" {
                AccountBrain.uploadCoverImage(coverImage: coverImage.image! , profileImage: profileImageView.image!, id: profile._id!)
            }
            AccountBrain.uploadCoverImage(coverImage: coverImage.image! , profileImage: profileImageView.image!, id: info2.CustomerId!)
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
        performSegue(withIdentifier: "profileToEditSegue", sender: self)
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
        if segue.identifier == "profileToEditSegue" {
            let destination = segue.destination as! EditProfileViewController
            destination.coverImage = coverImage.image
            destination.info3 = info2
            destination.edit = profile
           /*AccountBrain.copyAccount(account1: destination.edit , account2: profile)*/
            }
        /*if segue.identifier == "profileToFunctionalitiesSegue" {
            let destination = segue.destination as! notificationClickedViewController
            destination.userinfo1 = [profile._id!,profile.name!,profile.wallet_address!,profile.bio!,profile.url!,profile.profile_picture!,profile.couverture_picture!,profile.email!,""]
           
            }*/
        
    }
    //functions
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return fav.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fcell", for: indexPath as IndexPath)
            let contentView = cell.contentView
                    
            let label = contentView.viewWithTag(2) as! UILabel
            let imageView = contentView.viewWithTag(1) as! UIImageView
                    
        label.text = fav[indexPath.row].name!
        if  URL(string: fav[indexPath.row].image!) != nil {
            let url2 = URL(string:fav[indexPath.row].image!)!
            let dataTask2 = URLSession.shared.dataTask(with: url2) { (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        imageView.image = UIImage(data: data)!
                        
                    }
                }
                
            }
            dataTask2.resume()
        }
            //imageView.image = UIImage(named: "")
                    
                    return cell

        }

   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
            AssetsBrain.deleteItem(index: indexPath.row, fav: fav)
            fav.remove(at: indexPath.row)
            collectionView.reloadData()
               }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(info2.token!)
        LabelName.text = profile.name!
        AddressLabel.text = profile.wallet_address!
        BioLabel.text = profile.bio
        UrlLabel.text = profile.url!
        print(profile.couverture_picture!)
        fav = AssetsBrain.fetchData()
        print(fav)
        if  URL(string: profile.profile_picture!) != nil {
            let url = URL(string: profile.profile_picture!)!
            let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        self.smallImage.image = UIImage(data: data)!
                        self.profileImageView.image = UIImage(data: data)!
                    }
                }
                
            }

            // Start Data Task
            dataTask.resume()
            
        }
        
        if  URL(string: profile.couverture_picture!) != nil {
            let url2 = URL(string: profile.couverture_picture!)!
            let dataTask2 = URLSession.shared.dataTask(with: url2) { (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        self.coverImage.image = UIImage(data: data)!
                        
                    }
                }
                
            }
            dataTask2.resume()
        }
        
        
            
        
        

        print(profile.profile_picture!)
    
        
        profileImageView.layer.cornerRadius = 70
        smallImage.layer.cornerRadius = 20
        smallImage.image = profileImage
        

        
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
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
