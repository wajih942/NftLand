//
//  ApiViewController.swift
//  nft
//
//  Created by wajih on 11/30/21.
//

import UIKit
import FacebookCore
import GoogleSignIn
import FacebookLogin

class ApiViewController: UIViewController  {

    
    
    //gmail
    let signInConfig = GIDConfiguration.init(clientID: "149343891384-bm2593mjqvp3af1goi98imcl6leh2d9v.apps.googleusercontent.com")
    var emailAddress :String?
    
    @IBAction func googleSignIn(_ sender: Any) {
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            
            self.emailAddress = user.profile?.email

            let fullName = user.profile?.name
            let givenName = user.profile?.givenName
            let familyName = user.profile?.familyName

            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            print(self.emailAddress)
            
           
            
        }
        
    //ibaction
        }
    @IBAction func fbButton(_ sender: Any) {
        loginButtonClicked()
    
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     /* if let token = AccessToken.current ,!token.isExpired{
            let token = token.tokenString
            let request = FacebookCore.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
            
          request.start(completionHandler: {
                connection,result,error  in print("\(result)")
            })
        } else {
           let loginButton = FBLoginButton()
            //loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["public_profile", "email"]
           // view.addSubview(loginButton)
        }
        
        */
       
    }
    

   /* func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
    let token = result?.token?.tokenString
        let request = FacebookCore.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
        
        request.start(completionHandler: {
            connection,result,error  in print("\(result)")
        })
       
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
*/
    func loginButtonClicked() {
       let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile","email"], from: self) { result, error in
            if let error = error {
                print("Encountered Erorr: \(error)")
            } else if let result = result, result.isCancelled {
                print("Cancelled")
            } else {
                self.getFBUserData()
            }
        }
        
    }
    func getFBUserData(){
        if let token = AccessToken.current ,!token.isExpired{
            let token = token.tokenString
            let request = FacebookCore.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
            
          request.start(completionHandler: {
                connection,result,error  in print("\(result)")
            })
      }
    }
    
}
