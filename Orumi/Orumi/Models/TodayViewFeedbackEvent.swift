//
//  FeedbackEvent.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 10/11/26.
//

import Foundation

struct TodayViewFeedbackEvent {
    enum FeedbackType {
        case addMealCompleted
        case removeMealCompleted
        case allMealsCompleted
        case dayEnded
        case missingMeals
    }

    let id: UUID = UUID()
    let type: FeedbackType
}
