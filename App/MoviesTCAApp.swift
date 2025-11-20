//
//  MoviesTCAApp.swift
//  MoviesTCA
//
//  Created by Adam Young on 17/11/2025.
//

import ComposableArchitecture
import SwiftUI

@main
struct MoviesTCAApp: App {

    @StateObject private var store = Store(
        initialState: AppRootFeature.State(),
        reducer: {
            AppRootFeature()
        }
    )

    var body: some Scene {
        WindowGroup {
            AppRootView(store: store)
        }
    }
}
