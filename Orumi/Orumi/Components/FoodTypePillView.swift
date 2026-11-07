//
//  FoodTypePillView.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 21/10/26.
//

import SwiftUI

struct FoodTypePillView: View {

    let foodType: FoodType
    var isSelected: Bool = false

    var body: some View {
        HStack {
            Image(foodType.icon)
                .resizable()
                .scaledToFit()
                .iconSize(.small)
            Text(foodType.title)
                .font(.caption)
        }
        .foregroundStyle(isSelected ? AppColors.primaryGreen : AppColors.secondaryText)
        .bold(isSelected)
        .padding(.vertical, SpaceSize.small.rawValue)
        .padding(.horizontal, SpaceSize.small.rawValue)
        .appSelectablePillStyle(
            background: AppColors.card,
            strokeColor: isSelected ? AppColors.primaryGreen : AppColors.border.opacity(0.6),
            strokeWidth: isSelected ? 2 : 1,
            cornerRadius: 12
        )
    }
}

#Preview {
    VStack {
        FoodTypePillView(foodType: .dairy)
        FoodTypePillView(foodType: .fats)
        FoodTypePillView(foodType: .fruit)
        FoodTypePillView(foodType: .grains)
        FoodTypePillView(foodType: .legumes)
        FoodTypePillView(foodType: .protein, isSelected: true)
        FoodTypePillView(foodType: .vegetables)
    }
}
