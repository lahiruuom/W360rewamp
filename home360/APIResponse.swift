//
//  APIResponse.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-16.
//

import Foundation

struct HomeGeneric: Decodable {
    let error: Bool
    let message: String
}

struct HomeResponse<T: Decodable>: Decodable {
    let error: Bool
    let message: String
    let payload: T
}

struct HomeResults<T: Decodable>: Decodable {
    let error: Bool
    let message: String
    let payload: [T]
}

struct HomeNowMVErrors<T: Decodable>: Decodable {
    let error: Bool
    let message: String
    let errors: [T]
}

struct HomeError: Error, Decodable {
    let error: Bool
    let message: String
}


