//
//  Movie.swift
//  TableView
//
//  Created by Abylaikhan Koshanov on 4/11/20.
//  Copyright © 2020 Abylaikhan Koshanov. All rights reserved.
//

import Foundation

class Movie: Codable {
    var title: String
    var type: String
    var year: String
    var id: String
    var posterURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case type = "Type"
        case year = "Year"
        case id = "imdbID"
        case posterURL = "Poster"
    }
}
