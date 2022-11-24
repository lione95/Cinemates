//
//  LingueParlate.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import Foundation

struct LingueParlate: Codable{
    
    var english_name: String?
    var iso_639_1: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey{
        case english_name = "english_name"
        case iso_639_1 = "iso_639_1"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.english_name = try container.decodeIfPresent(String.self, forKey: .english_name)
        self.iso_639_1 = try container.decodeIfPresent(String.self, forKey: .iso_639_1)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
    
}
