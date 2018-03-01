//
//  Post.swift
//  EncodeAndDecode
//
//  Created by Ansuke on 3/1/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation

struct Post: Encodable, Decodable {
    let body: String
    let id: Int
    let title: String
    let userId: Int
}
