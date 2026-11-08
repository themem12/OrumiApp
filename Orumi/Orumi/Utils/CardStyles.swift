//
//  CardStyles.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 01/06/26.
//

import SwiftUI

struct AppCardStyle: ViewModifier {

    var cornerRadius: CGFloat = 24

    func body(content: Content) -> some View {

        content
            .background(AppColors.card)
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        AppColors.border.opacity(0.8),
                        lineWidth: 1
                    )
            }
            .shadow(
                color: .black.opacity(0.1),
                radius: 10,
                y: 4
            )
    }
}

struct SoftCardStyle: ViewModifier {

    let background: Color
    let strokeColor: Color
    var strokeWidth: CGFloat = 1
    var cornerRadius: CGFloat = 24

    func body(content: Content) -> some View {

        content
            .background(background)
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        strokeColor,
                        lineWidth: strokeWidth
                    )
            }
            .shadow(
                color: .black.opacity(0.02),
                radius: 8,
                y: 3
            )
    }
}

struct SoftPointedCardStyle: ViewModifier {

    let background: Color
    let strokeColor: Color

    func body(content: Content) -> some View {

        content
            .background(background)
            .clipShape(
                RoundedRectangle(cornerRadius: 24)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(
                        strokeColor,
                        style: StrokeStyle(
                            lineWidth: 1.5,
                            dash: [8, 6]
                        )
                    )
            }
            .shadow(
                color: .black.opacity(0.02),
                radius: 8,
                y: 3
            )
    }
}

extension View {

    func appCardStyle() -> some View {
        modifier(AppCardStyle())
    }

    func appCardStyle(cornerRadius: CGFloat) -> some View {
        modifier(AppCardStyle(cornerRadius: cornerRadius))
    }

    func appSoftCardStyle(background: Color) -> some View {
        modifier(
            SoftCardStyle(
                background: background,
                strokeColor: AppColors.border.opacity(0.6)
            )
        )
    }

    func appSoftPointedCardStyle(background: Color, strokeColor: Color) -> some View {
        modifier(
            SoftPointedCardStyle(
                background: background,
                strokeColor: strokeColor
            )
        )
    }

    func appSelectablePillStyle(background: Color, strokeColor: Color, strokeWidth: CGFloat, cornerRadius: CGFloat) -> some View {
        modifier(
            SoftCardStyle(
                background: background,
                strokeColor: strokeColor,
                strokeWidth: strokeWidth,
                cornerRadius: cornerRadius
            )
        )
    }
}
