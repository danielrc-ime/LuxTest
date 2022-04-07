//
//  ItemsModel.swift
//  TestLux
//
//  Created by Yonusa iOS on 04/04/22.
//

import Foundation

// MARK: - ItemsModelElement
struct ItemsModel: Codable {
    let title: String
    let details: Details
}

// MARK: - Details
struct Details: Codable {
    let description: String
    let day: Int
}
