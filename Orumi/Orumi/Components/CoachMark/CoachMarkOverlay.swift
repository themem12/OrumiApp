//
//  CoachMarkOverlay.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 17/11/26.
//

import SwiftUI

struct CoachMarkOverlay: View {

    @State private var cardSize: CGSize = .zero
    
    let anchors: [CoachMarkTarget: Anchor<CGRect>]

    var body: some View {
        GeometryReader { proxy in
            if let anchor = anchors[.breakfast] {
                let targetFrame = proxy[anchor]

                let cardPosition = calculateCardPosition(
                    targetFrame: targetFrame,
                    cardSize: cardSize,
                    containerSize: proxy.size
                )

                let cardFrame = CGRect(
                    x: cardPosition.x - cardSize.width / 2,
                    y: cardPosition.y - cardSize.height / 2,
                    width: cardSize.width,
                    height: cardSize.height
                )

                let layout = CoachMarkLayout(
                    targetFrame: targetFrame,
                    cardFrame: cardFrame
                )

                ZStack {
                    CoachMarkBackdrop(targetFrame: targetFrame)
                        .fill(
                            .black.opacity(0.45),
                            style: FillStyle(eoFill: true)
                        )
                        .ignoresSafeArea()

                    CoachMarkCard(
                        message: "Aquí puedes editar tu plan semanal.",
                        arrowPosition: layout.arrowPosition
                    )
                    .frame(maxWidth: min(max(proxy.size.width - 48, 0), 420))
                    .onGeometryChange(for: CGSize.self) { geometry in
                        geometry.size
                    } action: { size in
                        cardSize = size
                    }
                    .position(cardPosition)
                }
            }
        }
    }
}
