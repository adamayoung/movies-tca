//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Adam Young on 29/05/2025.
//

import SDWebImageSwiftUI
import SwiftUI

public struct BackdropImage: View {

    private static let aspectRatio: CGFloat = 3840.0 / 2160.0

    private var url: URL?

    public init(url: URL?) {
        self.url = url
    }

    public var body: some View {
        GeometryReader { proxy in
            WebImage(url: url, options: .forceTransition)
                .resizable()
                .scaledToFill()
                .aspectRatio(Self.aspectRatio, contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                .background(Color.secondary.opacity(0.1))
        }
    }

    public func backdropHeight(_ height: CGFloat) -> some View {
        self.frame(width: height * Self.aspectRatio, height: height)
    }

    public func backdropWidth(_ width: CGFloat) -> some View {
        self.frame(width: width, height: width / Self.aspectRatio)
    }

}

#Preview {
    BackdropImage(
        url: URL(string: "https://image.tmdb.org/t/p/w1280/aESb695wTIF0tB7RTGRebnYrjFK.jpg")
    )
    .backdropWidth(350)
}
