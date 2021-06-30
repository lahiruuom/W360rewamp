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


//struct User: Decodable, Identifiable {
//    //    let mediaReferences: [MediaReference]?
//    var id: String = ""
//    var givenName: String = ""
//    var surname:  String = ""
//
//    init(id: String, givenName: String, surname: String) {
//        self.id = id
//        self.givenName = givenName
//        self.surname = surname
//    }
//
//    enum CodingKeys: String, CodingKey {
//        //        case mediaReferences = "media_references"
//        case id = "_id"
//        case givenName = "given_name"
//        case surname
//    }
//}
