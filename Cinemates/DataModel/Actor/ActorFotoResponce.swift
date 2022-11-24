//
//  ActorFotoResponce.swift
//  Cinemates
//
//  Created by Mattia Golino on 14/11/22.
//

import Foundation

struct ActorFotoResponce: Codable, Identifiable{
    
    var id: Int?
    var profiles: [ActorImage]?

    enum CodingKeys: String, CodingKey{
        case id = "id"
        case profiles = "profiles"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.profiles = try container.decodeIfPresent([ActorImage].self, forKey: .profiles)
    }

}
