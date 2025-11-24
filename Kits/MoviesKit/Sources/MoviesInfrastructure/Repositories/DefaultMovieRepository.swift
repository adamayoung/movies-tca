//
//  DefaultMovieRepository.swift
//  MoviesKit
//
//  Created by Adam Young on 28/05/2025.
//

import Foundation
import MoviesDomain
import TMDb

final class DefaultMovieRepository: MovieRepository {

    private let remoteDataSource: any MovieRemoteDataSource
    private let localDataSource: any MovieLocalDataSource

    init(
        remoteDataSource: some MovieRemoteDataSource,
        localDataSource: any MovieLocalDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func movie(withID id: Int) async throws(MovieRepositoryError) -> MoviesDomain.Movie {
        if let cachedMovie = await localDataSource.movie(withID: id) {
            return cachedMovie
        }
        
        let movie = try await remoteDataSource.movie(withID: id)
        localDataSource.setMovie(movie, for ID: id)
        return movie
    }

    func images(
        forMovie movieID: Int
    ) async throws(MovieRepositoryError) -> MoviesDomain.ImageCollection {
        let imageCollection = try await remoteDataSource.images(forMovie: movieID)
        return imageCollection
    }
    
    func popular(page: Int) async throws(MovieRepositoryError) -> [MoviePreview] {
        let movies = try await remoteDataSource.popular(page: page)
        return movies
    }

}
