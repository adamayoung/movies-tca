//
//  PersonDetailsView.swift
//  PersonDetailsFeature
//
//  Created by Adam Young on 17/11/2025.
//

import ComposableArchitecture
import DesignSystem
import SwiftUI

public struct PersonDetailsView: View {

    @Bindable private var store: StoreOf<PersonDetailsFeature>

    public init(store: StoreOf<PersonDetailsFeature>) {
        self._store = .init(store)
    }

    public var body: some View {
        ScrollView {
            if let person = store.person {
                content(person: person)
            }
        }
        .overlay {
            if store.isLoading {
                ProgressView()
            }
        }
        .task {
            store.send(.loadPerson)
        }
    }

    @ViewBuilder
    private func content(person: Person) -> some View {
        ProfileImage(url: person.profileURL)
            .frame(width: 300, height: 300)
            .cornerRadius(150)
            .clipped()

        Text(verbatim: person.name)
            .font(.title)
    }

}

#Preview {
    PersonDetailsView(
        store: Store(
            initialState: PersonDetailsFeature.State(id: 1),
            reducer: {
                PersonDetailsFeature()
            }
        )
    )
}
