//
//  ImageURLSet.swift
//  MoviesKit
//
//  Created by Adam Young on 20/11/2025.
//

import Foundation

public struct ImageURLSet: Sendable, Equatable {

    public let thumbnail: URL
    public let card: URL
    public let detail: URL
    public let full: URL

    public init(
        thumbnail: URL,
        card: URL,
        detail: URL,
        full: URL
    ) {
        self.thumbnail = thumbnail
        self.card = card
        self.detail = detail
        self.full = full
    }

}
