//
//  Data.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/12/21.
//

import Foundation


struct Airports: Codable {
    let data: [States]
}
struct States: Codable {
    let state: String
    let cities: [Cities]
}
struct Cities : Codable {
    var name: String
    var code: String
}
