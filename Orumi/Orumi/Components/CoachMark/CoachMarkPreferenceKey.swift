//
//  CoachMarkPreferenceKey.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 17/11/26.
//

import SwiftUI

struct CoachMarkPreferenceKey: PreferenceKey {
    static var defaultValue: [CoachMarkTarget: Anchor<CGRect>] = [:]

    static func reduce(
        value: inout [CoachMarkTarget: Anchor<CGRect>],
        nextValue: () -> [CoachMarkTarget: Anchor<CGRect>]
    ) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}
