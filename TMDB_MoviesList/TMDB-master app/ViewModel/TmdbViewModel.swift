//
//  TmdbViewModel.swift
//  TMDB_MoviesList
//
//  Created by mac os on 13/12/2024.
//

import Foundation
import SwiftUI

class TmdbViewModel: ObservableObject{
    
    @Published var moviesList : MoviesListModel?
    
    func getMoviesList() async{
        await Networking.shared.getMoviesList() { res, data, error in
            if error != "" {
                print(error)
            }
            if let data = data {
                self.moviesList = data
            }
        }
    }
}
