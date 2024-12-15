//
//  MoviesListView.swift
//  TMDB_MoviesList
//
//  Created by mac os on 15/12/2024.
//

import SwiftUI

struct MoviesListView: View{
    
    @StateObject private var viewModel = TmdbViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("Popular Movies")
                        .font(.title)
                        .foregroundColor(.black)
                    Spacer()
                }
                if let movies = viewModel.moviesList?.results, !movies.isEmpty {
                    ScrollView {
                        VStack {
                            ForEach(movies, id: \.self) { movie in
                                NavigationLink(destination: MovieDetailsView(movie: movie)) {
                                    VStack(alignment: .leading) {
                                        AsyncImage(url: URL(string: Endpoint.imageBase + movie.poster_path)) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(height: 200)
                                                .clipped()
                                        } placeholder: {
                                            HStack{
                                                Spacer()
                                                ProgressView()
                                                    .frame(height: 200)
                                                Spacer()
                                            }
                                        }
                                        .cornerRadius(10)
                                        
                                        HStack {
                                            Text(movie.title)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                            Spacer()
                                            HStack {
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                                Text(String(format: "%.1f", movie.vote_average))
                                                    .foregroundColor(Color.black)
                                                    .font(.headline)
                                            }
                                        }
                                        .padding(.horizontal)
                                        .padding(.top, 5)
                                        
                                        Text(movie.overview)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .lineLimit(2)
                                            .padding(.horizontal)
                                            .padding(.vertical, 5)
                                    }
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
                                    .padding(.vertical, 5)
                                }
                            }
                        }
                    }
                } else {
                    Spacer()
                    Text("Movies not found yet")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                }
            }.padding()
                .task {
                    await viewModel.getMoviesList()
                }
        }
    }
}
