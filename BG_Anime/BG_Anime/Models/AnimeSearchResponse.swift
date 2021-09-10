//
//  AnimeSearchResponse.swift
//  BG_Anime
//
//  Created by bhavesh on 11/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

struct AnimeSearchResponse: Codable {
    var results: [Anime]
}

struct Anime: Codable {
    var id: Int
    var url: String?
    var imageUrl: String?
    var title: String?
    var airing: Bool?
    var synopsis: String?
    var type: String?
    var episodes: Int?
    var score: Double?
    var startDate: String?
    var endDate: String?
    var members: Int?
    var rated: String?

    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url
        case imageUrl = "image_url"
        case title
        case airing
        case synopsis
        case type
        case episodes
        case score
        case startDate = "start_date"
        case endDate = "end_date"
        case members
        case rated
    }
}
