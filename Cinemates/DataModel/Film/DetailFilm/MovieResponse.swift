//
//  MovieResponse.swift
//  Cinemates
//
//  Created by Mattia Golino on 15/11/22.
//

import Foundation

struct MovieResponse: Codable{
    
    let page: Int?
    let results: [MovieResponseResults]?
    let total_pages: Int?
    let total_results: Int?
    
    enum CodingKeys: String, CodingKey{
        case page = "page"
        case results = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.results = try container.decode([MovieResponseResults].self, forKey: .results)
        self.total_pages = try container.decode(Int.self, forKey: .total_pages)
        self.total_results = try container.decode(Int.self, forKey: .total_results)
    }
}
