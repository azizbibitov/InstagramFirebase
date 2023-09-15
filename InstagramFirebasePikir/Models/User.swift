//
//  User.swift
//  InstagramFirebasePikir
//
//  Created by Aziz Bibitov on 15.09.2023.
//

import Foundation

struct User {
    let username: String
    let profileImageUrl: String
    
    init(dictionary: [String: Any]) {
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"]  as? String ?? ""
    }
}
