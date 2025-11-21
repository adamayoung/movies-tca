//
//  StretchyHeaderScrollView.swift
//  DesignSystem
//
//  Created by Adam Young on 21/11/2025.
//

import SwiftUI

public struct StretchyHeaderScrollView<Header: View, Content: View>: View {

    private var header: Header
    private var content: Content

    public init(
        @ViewBuilder header: () -> Header,
        @ViewBuilder content: () -> Content
    ) {
        self.header = header()
        self.content = content()
    }

    public var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                header

                content
                    .padding(.horizontal)
            }
        }
        .flexibleHeaderScrollView()
        .toolbar(removing: .title)
        .ignoresSafeArea(edges: .top)
    }

}

#Preview {
    NavigationStack {
        StretchyHeaderScrollView(
            header: {
                BackdropImage(
                    url: URL(string: "https://image.tmdb.org/t/p/w1280/56v2KjBlU4XaOv9rVYEQypROD7P.jpg")
                )
                .flexibleHeaderContent(height: 600)
            },
            content: {
                Text(verbatim: "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.")
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
        )
    }
}
