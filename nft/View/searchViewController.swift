//
//  searchViewController.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import UIKit

class searchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    //var
    
    var data = AssetsBrain.getAllItems()
    
    
    
    //iboutlets
    
    
    //ibactions
    
    @IBAction func notificationButton(_ sender: Any) {
    }
    
    @IBAction func profileButton(_ sender: Any) {
    }
    
    @IBAction func burgerButton(_ sender: Any) {
    }
    
    @IBAction func search(_ sender: Any) {
    }
    @IBAction func priceRangeSeekBar(_ sender: Any) {
    }
    @IBAction func mostLikedButton(_ sender: Any) {
    }
    @IBAction func colorsButton(_ sender: Any) {
    }
    @IBAction func onlyVerifiedButton(_ sender: Any) {
    }
    @IBAction func resetButton(_ sender: Any) {
        
    }
    @IBAction func NFTLandButton(_ sender: Any) {
    }
    @IBAction func infoButton(_ sender: Any) {
    }
    
    //functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {



            let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")

            let contentView = cell?.contentView
            
            let name = contentView?.viewWithTag(2) as! UILabel

            let price = contentView?.viewWithTag(3) as! UILabel
            
            let imageView = contentView?.viewWithTag(1) as! UIImageView
            
            name.text = data[indexPath.row].name!

            price.text = data[indexPath.row].price! + " ETH"
            
            let url = URL(string: data[indexPath.row].image!)!
            let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        imageView.image = UIImage(data: data)!
                    }
                }
                
            }

            // Start Data Task
            dataTask.resume()
            
            return cell!
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
