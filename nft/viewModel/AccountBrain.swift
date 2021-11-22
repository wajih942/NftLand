//
//  AccountBrain.swift
//  nft
//
//  Created by wajih on 11/16/21.
//

import Foundation
class AccountBrain {
    
    static func copyAccount(account1 : Account , account2 : Account){
        account1.WalletAddress = account2.WalletAddress
        account1.DisplayName = account2.DisplayName
        account1.CustomUrl = account2.CustomUrl
        account1.Bio = account2.Bio
        account1.Portfolio = account2.Portfolio
        account1.Password = account2.Password
        
        
    }
    
    /*func placeBid()   {
        
    }
    func AssetsForSaleinstantly()  {
        
    }
    func AssetsForSaleAuction() {
        
    }*/
}
