//
//  Customer.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import Foundation
class customer {
    let wallet_address : String
    var display_name : String?
    var custom_url :String?
    var bio : String?
    var portfolio :String?
    var social_media_accounts = [String]()
    init(wallet_address : String,display_name : String?,custom_url :String?,bio : String?,portfolio :String?, social_media_accounts : [String]) {
        self.wallet_address = wallet_address
        self.display_name = display_name
        self.custom_url = custom_url
        self.bio = bio
        self.portfolio = portfolio
        self.social_media_accounts = social_media_accounts
    }
    
    
    
}
