//
//  TMDbMovieRemoteDataSource.swift
//  MoviesKit
//
//  Created by Adam Young on 18/11/2025.
//

import CoreDomain
import Foundation
import MoviesDomain
import TMDb

final class TMDbMovieRemoteDataSource: MovieRemoteDataSource {

    private let movieService: any TMDb.MovieService

    init(movieService: some TMDb.MovieService) {
        self.movieService = movieService
    }

    func movie(withID id: Int) async throws(MovieRepositoryError) -> MovieEntity {
        let tmdbMovie: TMDb.Movie
        do {
            tmdbMovie = try await movieService.details(forMovie: id, language: "en")
        } catch let error {
            throw MovieRepositoryError(error)
        }

        let mapper = MovieEntityMapper()
        let movie = mapper.map(tmdbMovie)

        return movie
    }

}

extension MovieRepositoryError {

    fileprivate init(_ error: Error) {
        guard let error = error as? TMDbError else {
            self = .unknown(error)
            return
        }

        self.init(error)
    }

    fileprivate init(_ error: TMDbError) {
        switch error {
        case .notFound:
            self = .notFound
        case .unauthorised:
            self = .unauthorised
        default:
            self = .unknown(error)
        }
    }

}
