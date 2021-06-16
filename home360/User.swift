//
//  User.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import Foundation

// MARK: - User
struct User: Decodable {
    let mediaReferences: [MediaReference]?
    let id, givenName, surname, email: String?

    enum CodingKeys: String, CodingKey {
        case mediaReferences = "media_references"
        case id = "_id"
        case givenName = "given_name"
        case surname, email
    }
}
