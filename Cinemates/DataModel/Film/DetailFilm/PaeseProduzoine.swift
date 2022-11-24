//
//  PaeseProduzoine.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import Foundation

struct PaeseProduzoine: Codable{
    
    var iso_3166_1: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey{
        case iso_3166_1 = "iso_3166_1"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iso_3166_1 = try container.decodeIfPresent(String.self, forKey: .iso_3166_1)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
    
}
