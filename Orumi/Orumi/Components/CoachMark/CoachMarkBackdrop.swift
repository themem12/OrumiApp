//
//  CoachMarkBackdrop.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 17/11/26.
//

import SwiftUI

struct CoachMarkBackdrop: Shape {
    let targetFrame: CGRect

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.addRect(rect)

        let highlightFrame = targetFrame.insetBy(
            dx: -8,
            dy: -8
        )

        path.addRoundedRect(
            in: highlightFrame,
            cornerSize: CGSize(width: 20, height: 20)
        )

        return path
    }
}
