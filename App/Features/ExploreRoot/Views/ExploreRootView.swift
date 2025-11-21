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
    @Namespace private var namespace

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            ExploreView(
                store: store.scope(
                    state: \.explore,
                    action: \.explore
                ),
                transitionNamespace: namespace
            )
        } destination: { store in
            switch store.case {
            case .movieDetails(let store):
                MovieDetailsView(
                    store: store,
                    transitionNamespace: namespace
                )
//                .navigationTransition(.zoom(sourceID: store.id, in: namespace))
            case .tvSeriesDetails(let store):
                TVSeriesDetailsView(
                    store: store,
                    transitionNamespace: namespace
                )
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
