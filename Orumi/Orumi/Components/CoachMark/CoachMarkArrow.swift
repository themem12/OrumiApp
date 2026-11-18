//
//  CoachMarkArrow.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 17/11/26.
//

import SwiftUI

struct CoachMarkBubble: Shape {
    var arrowPosition: CGFloat = 0.5
    var arrowWidth: CGFloat = 24
    var arrowHeight: CGFloat = 16
    var cornerRadius: CGFloat = 16

    func path(in rect: CGRect) -> Path {
        let baseX = rect.width * arrowPosition

        return Path { path in
            path.move(to: CGPoint(x: cornerRadius, y: arrowHeight))

            path.addLine(to: CGPoint(x: baseX - arrowWidth / 2, y: arrowHeight))
            path.addLine(to: CGPoint(x: baseX, y: 0))
            path.addLine(to: CGPoint(x: baseX + arrowWidth / 2, y: arrowHeight))

            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: arrowHeight))

            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: arrowHeight + cornerRadius),
                control: CGPoint(x: rect.maxX, y: arrowHeight)
            )

            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))

            path.addQuadCurve(
                to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY),
                control: CGPoint(x: rect.maxX, y: rect.maxY)
            )

            path.addLine(to: CGPoint(x: cornerRadius, y: rect.maxY))

            path.addQuadCurve(
                to: CGPoint(x: 0, y: rect.maxY - cornerRadius),
                control: CGPoint(x: 0, y: rect.maxY)
            )

            path.addLine(to: CGPoint(x: 0, y: arrowHeight + cornerRadius))

            path.addQuadCurve(
                to: CGPoint(x: cornerRadius, y: arrowHeight),
                control: CGPoint(x: 0, y: arrowHeight)
            )

            path.closeSubpath()
        }
    }
}
