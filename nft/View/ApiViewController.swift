//
//  ApiViewController.swift
//  nft
//
//  Created by wajih on 11/30/21.
//

import UIKit
import FBSDKLoginKit

class ApiViewController: UIViewController,LoginButtonDelegate{

    
    //ibaction

    @IBAction func fbButton(_ sender: Any) {
        loginButtonClicked()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = AccessToken.current ,!token.isExpired{
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
            
            request.start()
        } else {
           let loginButton = FBLoginButton()
           // loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["public_profile", "email"]
            //view.addSubview(loginButton)
        }
        
       
    }
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
        
        request.start()
        print(result)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }

    func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile"], from: self) { result, error in
            if let error = error {
                print("Encountered Erorr: \(error)")
            } else if let result = result, result.isCancelled {
                print("Cancelled")
            } else {
                print("Logged In")
            }
        }
    }
}
