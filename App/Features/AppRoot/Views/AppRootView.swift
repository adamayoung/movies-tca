//
//  AppRootView.swift
//  MoviesTCA
//
//  Created by Adam Young on 17/11/2025.
//

import ComposableArchitecture
import SwiftUI

struct AppRootView: View {

    @Bindable var store: StoreOf<AppRootFeature>

    var body: some View {
        TabView(selection: $store.selectedTab) {
            Tab("Home", systemImage: "house", value: AppRootFeature.Tab.explore) {
                ExploreRootView(
                    store: store.scope(
                        state: \.explore,
                        action: \.explore
                    )
                )
            }
            
            Tab("Movies", systemImage: "film", value: AppRootFeature.Tab.movies) {
                MoviesRootView(
                    store: store.scope(
                        state: \.movies,
                        action: \.movies
                    )
                )
            }

            Tab("TV", systemImage: "tv", value: AppRootFeature.Tab.tvSeries) {
                TVSeriesRootView(
                    store: store.scope(
                        state: \.tvSeries,
                        action: \.tvSeries
                    )
                )
            }

            Tab("People", systemImage: "person", value: AppRootFeature.Tab.people) {
                PeopleRootView(
                    store: store.scope(
                        state: \.people,
                        action: \.people
                    )
                )
            }
        }
    }
}

#Preview {
    AppRootView(
        store: Store(
            initialState: AppRootFeature.State(),
            reducer: {
                AppRootFeature()
            }
        )
    )
}
