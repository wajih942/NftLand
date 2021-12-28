//
//  MintResponse.swift
//  nft
//
//  Created by wajih on 12/27/21.
//

import Foundation
struct MintResponse: Decodable{
    let err: String?
    let txHash:String?
    let result:String?
}
