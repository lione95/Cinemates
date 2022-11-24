//
//  AppartieneAllaCollezione.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import Foundation

struct AppartieneAllaCollezione: Codable, Identifiable{
    
    var id: Int?
    var name: String?
    var poster_path: String?
    var backdrop_path: String?
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case poster_path = "poster_path"
        case backdrop_path = "backdrop_path"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path)
        self.backdrop_path = try container.decodeIfPresent(String.self, forKey: .backdrop_path)
    }
    
}
