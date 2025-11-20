//
//  Movie.swift
//  MovieDetailsFeature
//
//  Created by Adam Young on 17/11/2025.
//

import Foundation

public struct Movie: Identifiable, Sendable, Equatable {

    public let id: Int
    public let title: String
    public let overview: String
    public let posterURL: URL?
    public let backdropURL: URL?

    public init(
        id: Int,
        title: String,
        overview: String,
        posterURL: URL? = nil,
        backdropURL: URL? = nil
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterURL = posterURL
        self.backdropURL = backdropURL
    }

}
