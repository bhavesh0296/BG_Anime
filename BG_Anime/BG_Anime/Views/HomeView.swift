//
//  HomeView.swift
//  BG_Anime
//
//  Created by bhavesh on 11/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    @State var animeList = [Anime]()


    var body: some View {
        List {
            ForEach(animeList, id: \.id) { anime in
                Text(anime.synopsis ?? "")
            }
        }.onAppear(perform: fetchAnime)
    }

    func fetchAnime() {
        AnimeSearchService.shared.fetchAnimeList("Naruto") { (result:Result<AnimeSearchResponse, Error>) in
            switch result{
            case .success(let data):
                self.animeList = data.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
