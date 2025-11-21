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
                header
                    .flexibleHeaderContent(height: 600)
            },
            content: {
                content
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

    @ViewBuilder private var header: some View {
        BackdropImage(url: movie?.backdropURL)
            .overlay(alignment: .bottom) {
                //                LogoImage(url: movie?.logoImage.originalURL)
                //                    .padding(.bottom, 20)
                //                    .frame(maxWidth: 300, maxHeight: 150, alignment: .bottom)
            }
    }

    @ViewBuilder private var content: some View {
        Text(verbatim: movie?.overview ?? "")
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
    }

}

#Preview {
    @Previewable @Namespace var namespace

    NavigationStack {
        MovieDetailsView(
            store: Store(
                initialState: MovieDetailsFeature.State(id: 1),
                reducer: {
                    MovieDetailsFeature()
                }
            ),
            transitionNamespace: namespace
        )
    }
}
