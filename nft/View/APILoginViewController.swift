
// Add this to the header of your file, e.g. in ViewController.swift

import FBSDKLoginKit
// Add this to the body
class APILoginViewController: UIViewController, LoginButtonDelegate{
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = AccessToken.current,
               !token.isExpired {
               // User is logged in, do work such as go to next view controller.
        }else{
            let loginButton = FBLoginButton()
            loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["public_profile", "email"]
            view.addSubview(loginButton)
        }
        
    }
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
        
        request.start(completionHandler :{connection,result,error in
            print(result)
            
       
    })
    


}
                      
                      
}

