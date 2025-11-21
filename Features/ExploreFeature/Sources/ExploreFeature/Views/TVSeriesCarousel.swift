//
//  TVSeriesCarousel.swift
//  ExploreFeature
//
//  Created by Adam Young on 21/11/2025.
//

import DesignSystem
import SwiftUI

struct TVSeriesCarousel: View {

    enum TVSeriesCarouselType: String {
        case backdrop
        case poster
    }

    var tvSeries: [TVSeriesPreview]
    var type: TVSeriesCarouselType
    var transitionNamespace: Namespace.ID
    var didSelectTVSeries: (TVSeriesPreview) -> Void

    var body: some View {
        Carousel {
            ForEach(Array(tvSeries.enumerated()), id: \.offset) { offset, tvSeries in
                switch type {
                case .backdrop:
                    Button {
                        didSelectTVSeries(tvSeries)
                    } label: {
                        BackdropCarouselCell(
                            imageURL: tvSeries.backdropURL,
                            transitionID: UUID(),
                            transitionNamespace: transitionNamespace
                        ) {
                            cellLabel(title: tvSeries.name, index: offset)
                        }
                    }
                    .buttonStyle(.plain)
                    .fixedSize(horizontal: true, vertical: false)

                case .poster:
                    Button {
                        didSelectTVSeries(tvSeries)
                    } label: {
                        PosterCarouselCell(
                            imageURL: tvSeries.posterURL,
                            transitionID: UUID(),
                            transitionNamespace: transitionNamespace
                        ) {
                            cellLabel(title: tvSeries.name, index: offset)
                        }
                    }
                    .buttonStyle(.plain)
                    .fixedSize(horizontal: true, vertical: false)
                }
            }
        }
        .contentMargins([.leading, .trailing], 16)
    }

    @ViewBuilder
    private func cellLabel(title: String, index: Int) -> some View {
        HStack(alignment: .top, spacing: 15) {
            Text(verbatim: "\(index + 1)")
                .font(.title)
                .bold()
                .foregroundStyle(Color.secondary)

            Text(verbatim: title)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Spacer()
        }
        .fixedSize(horizontal: false, vertical: true)
    }

}
//
//#Preview {
//    @Previewable @Namespace var transitionNamespace
//
//    NavigationStack {
//        ScrollView {
//            MovieCarousel(
//                movies: MovieListItemViewModel.previews,
//                type: .backdrop,
//                transitionNamespace: transitionNamespace
//            )
//
//            MovieCarousel(
//                movies: MovieListItemViewModel.previews,
//                type: .poster,
//                transitionNamespace: transitionNamespace
//            )
//        }
//    }
//}
