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
    private let namespace: Namespace.ID

    private var tvSeries: TVSeries? {
        store.tvSeries
    }

    public init(
        store: StoreOf<TVSeriesDetailsFeature>,
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
        .navigationTitle(tvSeries?.name ?? "")
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
        .task {
            store.send(.loadTVSeries)
        }
    }

    @ViewBuilder private var header: some View {
        BackdropImage(url: tvSeries?.backdropURL)
            .overlay(alignment: .bottom) {
                //                LogoImage(url: movie?.logoImage.originalURL)
                //                    .padding(.bottom, 20)
                //                    .frame(maxWidth: 300, maxHeight: 150, alignment: .bottom)
            }
    }

    @ViewBuilder private var content: some View {
        Text(verbatim: tvSeries?.overview ?? "")
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
    }

}

#Preview {
    @Previewable @Namespace var namespace

    TVSeriesDetailsView(
        store: Store(
            initialState: TVSeriesDetailsFeature.State(id: 1),
            reducer: {
                TVSeriesDetailsFeature()
            }
        ),
        transitionNamespace: namespace
    )
}
