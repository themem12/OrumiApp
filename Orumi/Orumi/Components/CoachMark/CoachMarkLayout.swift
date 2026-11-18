//
//  CoachMarkLayout.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 17/11/26.
//

import SwiftUI

struct CoachMarkLayout {
    let targetFrame: CGRect
    let cardFrame: CGRect

    var arrowTip: CGPoint {
        CGPoint(
            x: targetFrame.midX,
            y: targetFrame.maxY
        )
    }

    var arrowBase: CGPoint {
        CGPoint(
            x: targetFrame.midX,
            y: cardFrame.minY
        )
    }

    var arrowPosition: CGFloat {
        (targetFrame.midX - cardFrame.minX) / cardFrame.width
    }
}

extension View {
    func calculateCardPosition(
        targetFrame: CGRect,
        cardSize: CGSize,
        containerSize: CGSize
    ) -> CGPoint {
        let padding: CGFloat = 16
        let verticalSpacing: CGFloat = 16

        let x = min(
            max(targetFrame.midX, cardSize.width / 2 + padding),
            containerSize.width - cardSize.width / 2 - padding
        )

        let y = targetFrame.maxY
            + verticalSpacing
            + cardSize.height / 2

        return CGPoint(x: x, y: y)
    }
}
