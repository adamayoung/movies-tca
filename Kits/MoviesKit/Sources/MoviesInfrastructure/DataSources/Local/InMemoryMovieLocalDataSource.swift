//
//  InMemoryMovieLocalDataSource.swift
//  MoviesKit
//
//  Created by Adam Young on 24/11/2025.
//

import Foundation
import MoviesDomain

actor InMemoryMovieLocalDataSource: MovieLocalDataSource {
    
    private var movieCache: [Int: Movie] = [:]
    private var imageCache: [Int: ImageCollection] = [:]
    
    init() {}
    
    func movie(withID id: Int) async -> Movie? {
        movieCache[id]
    }
    
    func setMovie(_ movie: Movie, withID id: Int) async {
        movieCache[id] = movie
    }

    func images(forMovie movieID: Int) async -> ImageCollection? {
        imageCache[movieID]
    }
    
    func setImages(_ imageCollection: ImageCollection, forMovie movieID: Int) async {
        imageCache[movieID] = imageCollection
    }
    
}
