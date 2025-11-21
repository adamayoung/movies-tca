//
//  MovieCarousel.swift
//  ExploreFeature
//
//  Created by Adam Young on 06/06/2025.
//

import DesignSystem
import SwiftUI

struct MovieCarousel: View {

    enum MovieCarouselType: String {
        case backdrop
        case poster
    }

    var movies: [MoviePreview]
    var type: MovieCarouselType
    var transitionNamespace: Namespace.ID
    var didSelectMovie: (MoviePreview) -> Void

    var body: some View {
        Carousel {
            ForEach(Array(movies.enumerated()), id: \.offset) { offset, movie in
                switch type {
                case .backdrop:
                    Button {
                        didSelectMovie(movie)
                    } label: {
                        BackdropCarouselCell(
                            imageURL: movie.backdropURL,
                            transitionID: UUID(),
                            transitionNamespace: transitionNamespace
                        ) {
                            cellLabel(title: movie.title, index: offset)
                        }
                    }
                    .buttonStyle(.plain)
                    .fixedSize(horizontal: true, vertical: false)

                case .poster:
                    Button {
                        didSelectMovie(movie)
                    } label: {
                        PosterCarouselCell(
                            imageURL: movie.posterURL,
                            transitionID: UUID(),
                            transitionNamespace: transitionNamespace
                        ) {
                            cellLabel(title: movie.title, index: offset)
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
