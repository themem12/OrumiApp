//
//  CoachMarkCard.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 17/11/26.
//

import SwiftUI

struct CoachMarkCard: View {
    let message: String
    let arrowPosition: CGFloat

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image("Torti")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)

            Text(message)
                .font(.body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .padding(.top, 16)
        .background {
            CoachMarkBubble(arrowPosition: arrowPosition)
                .fill(.white)
        }
        .shadow(color: .black.opacity(0.15), radius: 12, y: 4)
    }
}
