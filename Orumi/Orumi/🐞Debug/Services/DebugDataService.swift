//
//  DebugDataService.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 06/07/26.
//

import Foundation

class DebugDataService {
    let mealService: MealDataServiceProtocol
    let debugDateProvider: DebugDateProvider

    init(mealService: MealDataServiceProtocol, debugDateProvider: DebugDateProvider) {
        self.mealService = mealService
        self.debugDateProvider = debugDateProvider
    }

    func load(_ preset: DebugPreset) {
        switch preset {
        case .firstLaunch:
            loadFirstLaunch()
        case .perfectWeek:
            loadPerfectWeek()
        case .fillWeekPlans:
            loadWeekPlans()
        case .mockupPlans:
            loadMockupPlans()
        case .deleteAll:
            deleteAll()
        case .addOneDay:
            addOneDay()
        case .removeOneDay:
            removeOneDay()
        case .setLiveDate:
            setLiveDate()
        case .removeTodayRecord:
            removeTodayRecord()
        }
    }

    private func loadFirstLaunch() {
        deleteAll()
    }

    private func loadPerfectWeek() {
        let calendar = Calendar.current
        let todayWeekDay = calendar.component(.weekday, from: debugDateProvider.today)

        guard var date = calendar.date(byAdding: .day, value: -todayWeekDay, to: debugDateProvider.today) else {
            return
        }

        for day in 1...todayWeekDay {
            guard let weekDay = WeekDay(rawValue: day) else { return }
            
            let dayPlan = DayPlan.getDayPlanFrom(weekDay: weekDay)
            for meal in dayPlan.meals {
                meal.isCompleted = true
            }
            debugDateProvider.useMock(date: date)
            mealService.deleteRecordFor(date: date)
            mealService.endDay(for: dayPlan, date: date)
            guard let newDate = calendar.date(byAdding: .day, value: 1, to: debugDateProvider.today) else {
                debugDateProvider.useLive()
                continue
            }
            date = newDate
        }
        debugDateProvider.useLive()
    }

    private func deleteAll() {
        mealService.deleteAllData()
        notifyUI()
    }

    private func loadMockupPlans() {
        // First we clean the dataBase before adding anything else
        mealService.deleteAllData()

        for day in WeekDay.allCases {
            Log.database("Creating \(day)")
            let dayPlan = mealService.getOrCreatePlan(for: day)
            Log.database("Got plan \(dayPlan.day)")
            for meal in dayPlan.meals {
                Log.database("Meal: \(meal.type)")
                switch meal.type {
                case .breakfast:
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .avocado
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .cheese
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .strawberries
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .jam
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .bread
                    )
                case .lunch:
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .brocoli
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .rice
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .jam
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .tortillas
                    )
                case .dinner:
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .mixedGreens
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .potatoes
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .jam
                    )
                case .collationAM:
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .almonds
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .cucumber
                    )
                case .collationPM:
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .strawberries
                    )
                    mealService.addFoodItem(
                        to: meal,
                        foodItem: .greekYogurt
                    )
                }
            }
        }

        notifyUI()
    }

    private func loadWeekPlans() {

        // First we clean the dataBase before adding anything else
        mealService.deleteAllData()

        for day in WeekDay.allCases {
            Log.database("Creating \(day)")
            let dayPlan = mealService.getOrCreatePlan(for: day)
            Log.database("Got plan \(dayPlan.day)")
            for meal in dayPlan.meals {
                Log.database("Meal: \(meal.type)")
                switch meal.type {
                case .breakfast:
                    for item in Meal.breakfast.items {
                        mealService.addFoodItem(to: meal, foodItem: item)
                    }
                case .lunch:
                    for item in Meal.lunch.items {
                        mealService.addFoodItem(to: meal, foodItem: item)
                    }
                case .dinner:
                    for item in Meal.dinner.items {
                        mealService.addFoodItem(to: meal, foodItem: item)
                    }
                case .collationAM:
                    for item in Meal.morningSnack.items {
                        mealService.addFoodItem(to: meal, foodItem: item)
                    }
                case .collationPM:
                    for item in Meal.afternoonSnack.items {
                        mealService.addFoodItem(to: meal, foodItem: item)
                    }
                }
            }
        }
        notifyUI()
    }

    private func addOneDay() {
        debugDateProvider.useMock(date: Calendar.current.date(byAdding: .day, value: 1, to: debugDateProvider.today) ?? .now)

        notifyUI()
    }

    private func removeOneDay() {
        debugDateProvider.useMock(date: Calendar.current.date(byAdding: .day, value: -1, to: debugDateProvider.today) ?? .now)

        notifyUI()
    }

    private func setLiveDate() {
        debugDateProvider.useLive()

        notifyUI()
    }

    private func removeTodayRecord() {
        mealService.deleteTodayRecord()

        notifyUI()
    }
}

extension DebugDataService {
    private func notifyUI() {
        NotificationCenter.default.post(
            name: .mealDataDidChange,
            object: nil
        )
    }
}
