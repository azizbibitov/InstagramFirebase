//
//  Post.swift
//  InstagramFirebasePikir
//
//  Created by Aziz Bibitov on 15.09.2023.
//

import Foundation

struct Post {
    let imageUrl: String
    init(dictionary: [String: Any]) {
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
    }
}
