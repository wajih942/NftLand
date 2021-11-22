//
//  Account.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import Foundation
import UIKit
class Account {
    var WalletAddress : String
    var DisplayName:String
    var CustomUrl:String
    var Bio :String
    var Portfolio:String
    var Password : String 
    
    init(WalletAddress : String,DisplayName:String,CustomUrl:String,Bio :String,Portfolio:String,Password : String) {
        self.WalletAddress = WalletAddress
        self.DisplayName = DisplayName
        self.CustomUrl = CustomUrl
        self.Bio = Bio
        self.Portfolio = Portfolio
        self.Password = Password
    }
    
    
}
