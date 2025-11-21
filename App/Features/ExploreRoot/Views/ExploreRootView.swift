//
//  ExploreRootView.swift
//  MoviesTCA
//
//  Created by Adam Young on 21/11/2025.
//

import ComposableArchitecture
import MovieDetailsFeature
import TVSeriesDetailsFeature
import PersonDetailsFeature
import SwiftUI
import ExploreFeature

struct ExploreRootView: View {

    @Bindable var store: StoreOf<ExploreRootFeature>

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            ExploreView(
                store: store.scope(
                    state: \.explore,
                    action: \.explore
                )
            )
        } destination: { store in
            switch store.case {
            case .movieDetails(let store):
                MovieDetailsView(store: store)
            case .tvSeriesDetails(let store):
                TVSeriesDetailsView(store: store)
            case .personDetails(let store):
                PersonDetailsView(store: store)
            }
        }
    }
}

#Preview {
    ExploreRootView(
        store: Store(
            initialState: ExploreRootFeature.State(),
            reducer: {
                ExploreRootFeature()
            }
        )
    )
}
