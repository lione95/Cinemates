//
//  MovieDetail.swift
//  Cinemates
//
//  Created by Mattia Golino on 10/11/22.
//

import Foundation
import SwiftUI

struct MovieDetail: Codable, Identifiable{
    
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: AppartieneAllaCollezione?
    var budget: Int?
    var genres: [Generi]?
    var homepage: String?
    var id: Int?
    var imdb_id: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Float
    var poster_path: String?
    var production_companies: [Produttori]?
    var production_countries: [PaeseProduzoine]?
    var release_date: String?
    var runtime: Int?
    var spoken_languages: [LingueParlate]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int?
    
    enum CodingKeys: String, CodingKey{
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case belongs_to_collection = "belongs_to_collection"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdb_id = "imdb_id"
        case original_language = "original_language"
        case original_title = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case production_companies = "production_companies"
        case production_countries = "production_countries"
        case release_date = "release_date"
        case runtime = "runtime"
        case spoken_languages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.backdrop_path = try container.decodeIfPresent(String.self, forKey: .backdrop_path)
        self.belongs_to_collection = try container.decodeIfPresent(AppartieneAllaCollezione.self, forKey: .belongs_to_collection)
        self.budget = try container.decodeIfPresent(Int.self, forKey: .budget)
        self.genres = try container.decodeIfPresent([Generi].self, forKey: .genres)
        self.homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.imdb_id = try container.decodeIfPresent(String.self, forKey: .imdb_id)
        self.original_language = try container.decodeIfPresent(String.self, forKey: .original_language)
        self.original_title = try container.decodeIfPresent(String.self, forKey: .original_title)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.popularity = try container.decode(Float.self, forKey: .popularity)
        self.poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path)
        self.production_companies = try container.decodeIfPresent([Produttori].self, forKey: .production_companies)
        self.production_countries = try container.decodeIfPresent([PaeseProduzoine].self, forKey: .production_countries)
        self.release_date = try container.decodeIfPresent(String.self, forKey: .release_date)
        self.runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
        self.spoken_languages = try container.decodeIfPresent([LingueParlate].self, forKey: .spoken_languages)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.vote_average = try container.decodeIfPresent(Float.self, forKey: .vote_average)
        self.vote_count = try container.decodeIfPresent(Int.self, forKey: .vote_count)
    }
    
}
