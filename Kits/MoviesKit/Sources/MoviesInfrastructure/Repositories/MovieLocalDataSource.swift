//
//  MovieLocalDataSource.swift
//  MoviesKit
//
//  Created by Adam Young on 24/11/2025.
//

import Foundation
import MoviesDomain

protocol MovieLocalDataSource: Sendable, Actor {
    
    func movie(withID id: Int) async -> Movie?
    
    func setMovie(_ movie: Movie, withID id: Int) async

    func images(forMovie movieID: Int) async -> ImageCollection?
    
    func setImages(_ imageCollection: ImageCollection, forMovie movieID: Int) async

}
