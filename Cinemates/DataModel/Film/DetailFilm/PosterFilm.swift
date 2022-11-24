//
//  PosterFilm.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import Foundation

struct PosterFilm: Codable, Identifiable{
    
    var id = UUID()
    var aspect_ratio: Double?
    var file_path: String?
    var height: Int?
    var iso_639_1: String?
    var vote_average: Int?
    var vote_count: Int?
    var width: Int?
    
    enum CodingKeys: String, CodingKey{
        case aspect_ratio = "aspect_ratio"
        case file_path = "file_path"
        case height = "height"
        case iso_639_1 = "iso_639_1"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
        case width = "width"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.aspect_ratio = try container.decodeIfPresent(Double.self, forKey: .aspect_ratio)
        self.file_path = try container.decodeIfPresent(String.self, forKey: .file_path)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height)
        self.iso_639_1 = try container.decodeIfPresent(String.self, forKey: .iso_639_1)
        self.vote_average = try container.decodeIfPresent(Int.self, forKey: .vote_average)
        self.vote_count = try container.decodeIfPresent(Int.self, forKey: .vote_count)
        self.width = try container.decodeIfPresent(Int.self, forKey: .width)
    }
    
}
