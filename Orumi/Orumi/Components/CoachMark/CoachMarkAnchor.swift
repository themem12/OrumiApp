//
//  CoachMarkAnchor.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 17/11/26.
//

import SwiftUI

struct CoachMarkAnchor: ViewModifier {
    let target: CoachMarkTarget

    func body(content: Content) -> some View {
        content.anchorPreference(
            key: CoachMarkPreferenceKey.self,
            value: .bounds
        ) {
            [target: $0]
        }
    }
}

extension View {
    func coachMarkAnchor(_ target: CoachMarkTarget) -> some View {
        modifier(CoachMarkAnchor(target: target))
    }
}
