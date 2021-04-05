//
//  UserModel.swift
//  MVVM-REST-API
//
//  Created by Ruthlyn Huet on 4/5/21.
//

import Foundation

struct UserModel: Codable{
    let contacts: [Contact]
}

struct Contact: Codable{
    let name, email, address: String
}
