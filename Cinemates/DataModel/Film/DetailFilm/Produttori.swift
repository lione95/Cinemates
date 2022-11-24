//
//  Produttori.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import Foundation

struct Produttori: Codable, Identifiable{
    
    var id: Int?
    var logo_path: String?
    var name: String?
    var origin_country: String?
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case logo_path = "logo_path"
        case name = "name"
        case origin_country = "origin_country"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.logo_path = try container.decodeIfPresent(String.self, forKey: .logo_path)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.origin_country = try container.decodeIfPresent(String.self, forKey: .origin_country)
    }
    
}
