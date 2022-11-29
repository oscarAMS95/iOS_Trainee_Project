//
//  MovieListView.swift
//  MovieApp
//
//  Created by Oscar Martinez on 11/24/22.
//

import SwiftUI
struct MovieListView<T: Movie>: View {
    
    var movies: [T]
    var section: HomeSection
    
    var body: some View {
        NavigationView {
            List(0..<movies.count) { i in
                    MovieListRow<T>(movie: self.movies[i])
            }.navigationBarTitle(section.rawValue)
        }
    }
}
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView<Popular>(movies: [], section: .Trending)
    }
}
