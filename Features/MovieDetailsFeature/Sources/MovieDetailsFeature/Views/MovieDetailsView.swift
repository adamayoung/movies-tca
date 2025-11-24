//
//  MovieDetailsView.swift
//  MovieDetailsFeature
//
//  Created by Adam Young on 17/11/2025.
//

import ComposableArchitecture
import DesignSystem
import SwiftUI

public struct MovieDetailsView: View {

    @Bindable private var store: StoreOf<MovieDetailsFeature>
    private let namespace: Namespace.ID

    private var movie: Movie? {
        store.movie
    }

    public init(
        store: StoreOf<MovieDetailsFeature>,
        transitionNamespace: Namespace.ID
    ) {
        self._store = .init(store)
        self.namespace = transitionNamespace
    }

    public var body: some View {
        StretchyHeaderScrollView(
            header: {
                BackdropImage(url: movie?.backdropURL)
                    .flexibleHeaderContent(height: 600)
            },
            headerOverlay: {
                LogoImage(url: movie?.logoURL)
                    .padding(.bottom, 20)
                    .frame(maxWidth: 300, maxHeight: 150, alignment: .bottom)
            },
            content: {
                Text(verbatim: movie?.overview ?? "")
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal)
            }
        )
        .task {
            store.send(.loadMovie)
        }
        .navigationTitle(movie?.title ?? "")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }

}

#Preview {
    @Previewable @Namespace var namespace

    NavigationStack {
        MovieDetailsView(
            store: Store(
                initialState: MovieDetailsFeature.State(movieID: 1),
                reducer: {
                    MovieDetailsFeature()
                }
            ),
            transitionNamespace: namespace
        )
    }
}
