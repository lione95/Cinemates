//
//  NowPlayingResponse.swift
//  Cinemates
//
//  Created by Mattia Golino on 11/11/22.
//

import Foundation

struct NowPlayingResponce: Codable{
    
    let page: Int?
    let results: [MovieResponseResults]?
    let dates: ReleaseDates?
    let total_pages: Int?
    let total_results: Int?
    
    enum CodingKeys: String, CodingKey{
        case page = "page"
        case results = "results"
        case dates = "dates"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.results = try container.decode([MovieResponseResults].self, forKey: .results)
        self.dates = try container.decode(ReleaseDates.self, forKey: .dates)
        self.total_pages = try container.decode(Int.self, forKey: .total_pages)
        self.total_results = try container.decode(Int.self, forKey: .total_results)
    }
    
}
