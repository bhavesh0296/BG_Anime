//
//  AnimeSearchService.swift
//  BG_Anime
//
//  Created by bhavesh on 11/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

class AnimeSearchService {

    static let shared = AnimeSearchService()

    private init() { }

    func fetchAnimeList<T: Codable>(_ name: String, completion: @escaping (Result<T, Error>) -> Void) {
        APIService.shared.getRequest(.naruto, completion: completion)
    }
}
