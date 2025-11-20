//
//  TVSeriesDetailsView.swift
//  TVSeriesDetailsFeature
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import DesignSystem
import SwiftUI

public struct TVSeriesDetailsView: View {

    @Bindable private var store: StoreOf<TVSeriesDetailsFeature>

    public init(store: StoreOf<TVSeriesDetailsFeature>) {
        self._store = .init(store)
    }

    public var body: some View {
        ScrollView {
            if let tvSeries = store.tvSeries {
                content(tvSeries: tvSeries)
            }
        }
        .overlay {
            if store.isLoading {
                ProgressView()
            }
        }
        .task {
            store.send(.loadTVSeries)
        }
    }

    @ViewBuilder
    private func content(tvSeries: TVSeries) -> some View {
        PosterImage(url: tvSeries.posterURL)
            .posterHeight(500)
            .cornerRadius(5)

        Text(verbatim: tvSeries.name)
            .font(.title)
    }

}

#Preview {
    TVSeriesDetailsView(
        store: Store(
            initialState: TVSeriesDetailsFeature.State(id: 1),
            reducer: {
                TVSeriesDetailsFeature()
            }
        )
    )
}
