//
//  ViewController.swift
//  nft
//
//  Created by wajih on 1/3/22.
//

import UIKit
import Lottie
class ViewController: UIViewController {

    let animationView = AnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setupAnimation()  {
        animationView.animation = Animation.named("cards")
        animationView.frame = view.bounds
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }
    @IBAction func button(_ sender: Any) {
        setupAnimation()
        print("mrigel")
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
