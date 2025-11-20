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

    private var movie: Movie? {
        store.movie
    }

    public init(store: StoreOf<MovieDetailsFeature>) {
        self._store = .init(store)
    }

    public var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                header
                    .flexibleHeaderContent(height: 600)

                content
                    .padding(.horizontal)
            }
        }
        .flexibleHeaderScrollView()
        .task {
            store.send(.loadMovie)
        }
        .navigationTitle(movie?.title ?? "")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
        .toolbar(removing: .title)
        .ignoresSafeArea(edges: .top)
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
    MovieDetailsView(
        store: Store(
            initialState: MovieDetailsFeature.State(id: 1),
            reducer: {
                MovieDetailsFeature()
            }
        )
    )
}
