//
//  FoodTypePillView.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 21/10/26.
//

import SwiftUI

struct FoodTypePillView: View {

    let foodType: FoodType

    var body: some View {
        HStack {
            Image(foodType.icon)
                .resizable()
                .scaledToFit()
                .iconSize(.xSmall)
            Text(foodType.title)
                .font(.caption)
        }
        .foregroundStyle(AppColors.secondaryText)
        .padding(.vertical, SpaceSize.small.rawValue)
        .padding(.horizontal, SpaceSize.small.rawValue)
        .appCardStyle(cornerRadius: 12)
    }
}

#Preview {
    VStack {
        FoodTypePillView(foodType: .dairy)
        FoodTypePillView(foodType: .fats)
        FoodTypePillView(foodType: .fruit)
        FoodTypePillView(foodType: .grains)
        FoodTypePillView(foodType: .legumes)
        FoodTypePillView(foodType: .protein)
        FoodTypePillView(foodType: .vegetables)
    }
}
