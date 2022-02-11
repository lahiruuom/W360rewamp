//
//  RegisterRes.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-19.
//

import Foundation

// MARK: - RegisterRes
struct RegisterRes: Codable {
    let id: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
    }
}
