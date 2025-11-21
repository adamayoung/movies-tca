//
//  ExploreView.swift
//  ExploreFeature
//
//  Created by Adam Young on 21/11/2025.
//

import ComposableArchitecture
import DesignSystem
import SwiftUI

public struct ExploreView: View {
    
    @Bindable var store: StoreOf<ExploreFeature>
    
    public init(store: StoreOf<ExploreFeature>) {
        self._store = .init(store)
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                Text("Movies: \(store.trendingMovies.movies.count)")
            }
        }
        .navigationTitle("Home")
        .task {
            store.send(.load)
        }
    }

}

#Preview {
    NavigationStack {
        ExploreView(
            store: Store(
                initialState: ExploreFeature.State(),
                reducer: {
                    ExploreFeature()
                }
            )
        )
    }
}
