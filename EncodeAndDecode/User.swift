//
//  User.swift
//  EncodeAndDecode
//
//  Created by Ansuke on 3/1/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation

struct User: Decodable {
    let company: Company
    let address: Address
    let email: String
    let id: Int
    let name: String
    let phone: String
    let username: String
    let website: String
}

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Decodable {
    let lat: String
    let lng: String
}

struct Company: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}
