//
//  UserInfo.swift
//  nft
//
//  Created by wajih on 12/30/21.
//

import Foundation
struct UserInfo: Decodable{
    var _id : String?
    var name: String?
    var wallet_address:String?
    var bio:String?
    var url:String?
    var profile_picture:String?
    var couverture_picture :String?
    var email: String?
    var password : String?
}
