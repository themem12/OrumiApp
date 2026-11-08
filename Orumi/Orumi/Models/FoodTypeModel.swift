//
//  FoodTypeModel.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 21/10/26.
//

import Foundation
import DeveloperToolsSupport

enum FoodType: String, Codable, CaseIterable, Identifiable {

    var id: String {
        rawValue
    }

    case protein
    case vegetables
    case fruit
    case grains
    case dairy
    case fats
    case legumes

    var title: String {
        switch self {
        case .protein:
            return String(localized: .foodTypeTitleProtein)
        case .vegetables:
            return String(localized: .foodTypeTitleVegetables)
        case .fruit:
            return String(localized: .foodTypeTitleFruit)
        case .grains:
            return String(localized: .foodTypeTitleGrains)
        case .dairy:
            return String(localized: .foodTypeTitleDairy)
        case .fats:
            return String(localized: .foodTypeTitleFats)
        case .legumes:
            return String(localized: .foodTypeTitleLegumes)
        }
    }

    var icon: ImageResource {
        switch self {
        case .protein:
                .protein
        case .vegetables:
                .vegetables
        case .fruit:
                .fruit
        case .grains:
                .grains
        case .dairy:
                .dairy
        case .fats:
                .fats
        case .legumes:
                .legumes
        }
    }
}
