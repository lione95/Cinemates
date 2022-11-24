//
//  FotoResponce.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import Foundation

struct FotoResponce: Codable, Identifiable{
    
    var id: Int?
    var backdrops: [PosterFilm]?
    var posters: [PosterFilm]?

    enum CodingKeys: String, CodingKey{
        case id = "id"
        case backdrops = "backdrops"
        case posters = "posters"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.backdrops = try container.decodeIfPresent([PosterFilm].self, forKey: .backdrops)
        self.posters = try container.decodeIfPresent([PosterFilm].self, forKey: .posters)
    }
}
