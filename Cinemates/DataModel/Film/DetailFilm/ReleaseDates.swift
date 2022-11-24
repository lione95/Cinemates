//
//  ReleaseDates.swift
//  Cinemates
//
//  Created by Mattia Golino on 08/11/22.
//

import Foundation

struct ReleaseDates: Codable {
    
    let maximum: String?
    let minimum: String?
    
    enum CodingKeys: String, CodingKey{
        case maximum = "maximum"
        case minimum = "minimum"
    }
    
   init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maximum = try container.decode(String.self, forKey: .maximum)
        self.minimum = try container.decode(String.self, forKey: .minimum)
    }
    
}
