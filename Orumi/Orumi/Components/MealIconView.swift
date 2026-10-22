//
//  MealIconView.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 15/06/26.
//

import SwiftUI

struct MealIconView: View {

    let mealType: MealType
    let size: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .frame(width: size, height: size)
                .foregroundStyle(mealType.color.opacity(0.4))
            Image(mealType.icon)
                .resizable()
                .scaledToFit()
                .font(.system(size: size/2))
                .foregroundStyle(mealType.color)
        }
    }
}

#Preview {
    MealIconView(
        mealType: .lunch,
        size: 350
    )
}
