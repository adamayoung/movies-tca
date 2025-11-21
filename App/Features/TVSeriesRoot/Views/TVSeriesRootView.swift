//
//  TVSeriesNavigationStack.swift
//  MoviesTCA
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import SwiftUI
import TVSeriesDetailsFeature
import TrendingTVSeriesFeature

struct TVSeriesRootView: View {

    @Bindable var store: StoreOf<TVSeriesRootFeature>
    @Namespace private var namespace

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            TrendingTVSeriesView(
                store: store.scope(
                    state: \.trending,
                    action: \.trending
                )
            )
        } destination: { store in
            switch store.case {
            case .details(let store):
                TVSeriesDetailsView(
                    store: store,
                    transitionNamespace: namespace
                )
            }
        }
    }
}

#Preview {
    TVSeriesRootView(
        store: Store(
            initialState: TVSeriesRootFeature.State(),
            reducer: {
                TVSeriesRootFeature()
            }
        )
    )
}
