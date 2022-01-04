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
import AuthenticationServices
class ApiViewController: UIViewController  ,ASAuthorizationControllerPresentationContextProviding,ASAuthorizationControllerDelegate{
    //vars
    let defaults = UserDefaults.standard
    
    var profile = UserInfo(_id: "", name: "", wallet_address: "", bio: "", url: "", profile_picture: "", couverture_picture: "", email: "", password: "")
    
    
    //ibactions
    
    
    @IBAction func signinbutton(_ sender: Any) {
        
        performSegue(withIdentifier: "welcomeToSigninSegue", sender: self)
    }
    
    
    @IBAction func signupbutton(_ sender: Any) {
        performSegue(withIdentifier: "welcomeToSignupSegue", sender: self)
    }
    
    //iboutlets
    
    
    
    
    
    //functions


    
    
    
    
    //apple
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("failed")
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential :
            let firstName = credentials.fullName?.givenName
            let lastName = credentials.fullName?.familyName
            let email = credentials.email
            print(firstName)
            break
        default :
            break
            
        }
    }
    
    @IBAction func appleLogin(_ sender: Any) {
        appleSignIn()
    }
    func appleSignIn()  {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName,.email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    
    //google
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signintoprofileSegue" {
            let destination = segue.destination as! visitProfileViewController
            if let user =  defaults.array(forKey: "user") as? [String]{
                profile = UserInfo(_id: user[0], name: user[1], wallet_address: user[2], bio: user[3], url: user[4], profile_picture: user[5], couverture_picture: user[6], email: user[7], password: user[8])
                print(profile)
                print(user)
            }
            destination.profile = profile
    }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user =  defaults.array(forKey: "user") as? [String]{
            if user[0] != "" {
                performSegue(withIdentifier: "signintoprofileSegue", sender: self)
            }
                       
                    }

        
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
            let request = FacebookCore.GraphRequest(graphPath: "me", parameters: ["fields":"email,name,picture"], tokenString: token, version: nil, httpMethod: .get)
            
          request.start(completionHandler: {
                connection,result,error -> Void in
              print(result)
                  
             
              
            
              
            })
      }
    }
    
}
