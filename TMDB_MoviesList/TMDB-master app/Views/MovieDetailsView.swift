//
//  MovieDetailsView.swift
//  TMDB_MoviesList
//
//  Created by mac os on 15/12/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movie: MoviesModel

    var body: some View {
        ZStack {
            VStack(){
                AsyncImage(url: URL(string: Endpoint.imageBase + movie.poster_path)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 600)
                        .clipped()
                        .ignoresSafeArea()
                } placeholder: {
                    ProgressView()
                        .frame(height: 600)
                }
                VStack(alignment: .leading){
                    Text(movie.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", movie.vote_average))
                            .font(.headline)
                        Spacer()
                        Text(movie.release_date)
                            .font(.headline)
                    }.padding(.bottom, 10)
                    Text("Overview")
                        .font(.headline)
                        .padding(.bottom, 5)

                    Text(movie.overview)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                        .padding(.bottom, 10)
                    Spacer()
                }.padding(.horizontal , 10)
            }
        }
        .ignoresSafeArea()
    }
}
