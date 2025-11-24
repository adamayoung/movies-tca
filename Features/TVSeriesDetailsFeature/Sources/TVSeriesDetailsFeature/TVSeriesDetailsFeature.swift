//
//  TVSeriesDetailsFeature.swift
//  TVSeriesDetailsFeature
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import Foundation

@Reducer
public struct TVSeriesDetailsFeature: Sendable {

    @Dependency(\.tvSeriesDetails) private var tvSeriesDetails: TVSeriesDetailsClient

    @ObservableState
    public struct State {
        var id: Int
        public let transitionID: String?
        var tvSeries: TVSeries?
        var isLoading: Bool

        public init(
            id: Int,
            transitionID: String? = nil,
            tvSeries: TVSeries? = nil,
            isLoading: Bool = false
        ) {
            self.id = id
            self.transitionID = transitionID
            self.tvSeries = tvSeries
            self.isLoading = isLoading
        }
    }

    public enum Action {
        case loadTVSeries
        case tvSeriesLoaded(TVSeries)
    }

    public init() {}

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadTVSeries:
                state.isLoading = true
                return handleFetchTVSeries(&state)

            case .tvSeriesLoaded(let tvSeries):
                state.isLoading = false
                state.tvSeries = tvSeries
                return .none
            }
        }
    }

}

extension TVSeriesDetailsFeature {

    fileprivate func handleFetchTVSeries(_ state: inout State) -> EffectOf<Self> {
        let id = state.id

        return .run { send in
            do {
                let tvSeries = try await tvSeriesDetails.fetch(id)
                await send(.tvSeriesLoaded(tvSeries))
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
