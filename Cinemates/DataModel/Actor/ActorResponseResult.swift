//
//  ActorResponseResult.swift
//  Cinemates
//
//  Created by Mattia Golino on 11/11/22.
//

import Foundation

struct ActorResponseResult: Codable, Identifiable{
    
    var adult: Bool?
    var gender: Int?
    var id: Int?
    var known_for: [AttoriResponseResultsKnownFor]?
    var known_for_department: String?
    var name: String?
    var profile_path: String?
    
    enum CodingKeys: String, CodingKey{
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for = "known_for"
        case known_for_department = "known_for_department"
        case name = "name"
        case profile_path = "profile_path"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.gender = try container.decodeIfPresent(Int.self, forKey: .gender)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.known_for = try container.decodeIfPresent([AttoriResponseResultsKnownFor].self, forKey: .known_for)
        self.known_for_department = try container.decodeIfPresent(String.self, forKey: .known_for_department)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.profile_path = try container.decodeIfPresent(String.self, forKey: .profile_path)
    }
}
