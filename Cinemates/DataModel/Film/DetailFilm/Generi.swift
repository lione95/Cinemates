//
//  Generi.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import Foundation

struct Generi: Codable, Identifiable{
    
    var id: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
    
}
