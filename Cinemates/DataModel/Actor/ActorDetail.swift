//
//  ActorDetail.swift
//  Cinemates
//
//  Created by Mattia Golino on 11/11/22.
//

import Foundation


struct ActorDetail: Codable, Identifiable{
    
    var birthday: String?
    var known_for_department: String?
    var deathday: String?
    var id: Int?
    var name: String?
    var also_known_as: [String]?
    var gender: Int?
    var biography: String?
    var popularity: Float?
    var place_of_birth: String?
    var profile_path: String?
    var adult: Bool?
    var imdb_id: String?
    var homepage: String?
    
    enum CodingKeys: String, CodingKey{
        case birthday = "birthday"
        case known_for_department = "known_for_department"
        case deathday = "deathday"
        case id = "id"
        case name = "name"
        case also_known_as = "also_known_as"
        case gender = "gender"
        case biography = "biography"
        case popularity = "popularity"
        case place_of_birth = "place_of_birth"
        case profile_path = "profile_path"
        case adult = "adult"
        case imdb_id = "imdb_id"
        case homepage = "homepage"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.birthday = try container.decodeIfPresent(String.self, forKey: .birthday)
        self.known_for_department = try container.decodeIfPresent(String.self, forKey: .known_for_department)
        self.deathday = try container.decodeIfPresent(String.self, forKey: .deathday)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.also_known_as = try container.decodeIfPresent([String].self, forKey: .also_known_as)
        self.gender = try container.decodeIfPresent(Int.self, forKey: .gender)
        self.biography = try container.decodeIfPresent(String.self, forKey: .biography)
        self.popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
        self.place_of_birth = try container.decodeIfPresent(String.self, forKey: .place_of_birth)
        self.profile_path = try container.decodeIfPresent(String.self, forKey: .profile_path)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.imdb_id = try container.decodeIfPresent(String.self, forKey: .imdb_id)
        self.homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
    }
    
}
