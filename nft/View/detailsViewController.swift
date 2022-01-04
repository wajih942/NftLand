//
//  detailsViewController.swift
//  nft
//
//  Created by wajih on 12/31/21.
//

import UIKit

class detailsViewController: UIViewController {

    //vars
    var info = Meta(tokenId: "", seller: "", owner: "", price: "", name: "", description: "", image: "")
    
    
    
    
    //ibOutlets
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var sellerAddess: UILabel!
    
    
    //ibactions
    @IBAction func backButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    let defaults = UserDefaults.standard
    @IBAction func buyButton(_ sender: Any) {
        
        if let info1 =  defaults.array(forKey: "info") as? [String]{
            if info1[0] == info.seller!  {
                AssetsBrain.prompt(title: "warning", text: "this is your item", self: self)
            }else{
                performSegue(withIdentifier: "detailstobuynftSegue", sender: self)
            }
            
                       
        }

        
    }
    
    
    @IBAction func addfavoritesButton(_ sender: Any) {
        
        if AssetsBrain.checkAsset(meta: info) {
            AssetsBrain.prompt(title: "Asset exist", text: "you already added this asset to your favorites", self: self)
        }else{
            AssetsBrain.addtoFavorites(meta: info, self: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "detailstobuynftSegue" {
                let destination = segue.destination as! BuynftViewController
                destination.info = info
                
                
            }
            
        }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: info.image!)!
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self.itemImage.image = UIImage(data: data)!
                }
            }
            
        }

        // Start Data Task
        dataTask.resume()
        nameLabel.text = info.name!
        priceLabel.text = info.price!
        descriptionLabel.text = info.description!
        sellerAddess.text = info.seller!
        print(info)
       
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
