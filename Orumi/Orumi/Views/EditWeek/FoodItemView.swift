//
//  AddFoodItemView.swift
//  Orumi
//
//  Created by Guillermo Saavedra Dorantes  on 04/05/26.
//

import SwiftUI

struct FoodItemView: View {

    enum Field {
        case foodName
        case portion
    }

    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: FoodItemViewModel
    
    @FocusState private var focusedField: Field?

    init(viewModel: FoodItemViewModel) {
        _viewModel = State(
            initialValue: viewModel
        )
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(viewModel.mealType.color.opacity(0.4))
                    Image(viewModel.mealType.icon)
                        .resizable()
                        .scaledToFit()
                        .iconSize(.small)
                        .foregroundStyle(viewModel.mealType.color)
                }
                .accessibilityHidden(true)
                Text(viewModel.mealType.title)
                    .font(.title2.weight(.semibold))
            }
            .padding(.top)
            
            AppInputField(
                placeholder: String(localized: .foodItemViewFieldName),
                icon: "fork.knife",
                accentColor: viewModel.mealType.color,
                text: $viewModel.foodField
            )
            .focused($focusedField, equals: .foodName)
            .submitLabel(.next)
            .onSubmit {
                focusedField = .portion
            }
            AppInputField(
                placeholder: String(localized: .foodItemViewFieldPortion),
                icon: "scalemass",
                accentColor: viewModel.mealType.color,
                text: $viewModel.amountField
            )
            .focused($focusedField, equals: .portion)
            .submitLabel(.done)
            .onSubmit {
                focusedField = nil
            }

            FoodTypeCollectionView(
                foodTypeSelected: $viewModel.selectedFoodType
            )

            Button {
                viewModel.validateValues()
            } label: {
                Text(viewModel.buttonTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(viewModel.mealType.color)
                    )
            }
            .buttonStyle(.plain)
        }
        .padding()
        .onAppear() {
            focusedField = .foodName
        }
        .onChange(of: viewModel.didSaveFood) {
            dismiss()
        }
        .alert(
            String(localized: .foodItemViewWarningTitle),
            isPresented: $viewModel.showError
        ){
            Button(.foodItemViewWarningOk, role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
}

struct FoodTypeCollectionView: View {

    @Binding var foodTypeSelected: FoodType?

    var body: some View {
        FlowLayout(spacing: 8, rowSpacing: 8) {
            ForEach(FoodType.allCases) { foodType in
                Button {
                    foodTypeSelected = foodType
                } label: {
                    FoodTypePillView(
                        foodType: foodType,
                        isSelected: foodTypeSelected == foodType
                    )
                }
                .accessibilityLabel("Food type \(foodType.title)")
                .accessibilityHint(foodTypeSelected == foodType ? "Is selected" : "Select food type")
            }
        }
    }
}

#Preview {
    FoodItemView(
        viewModel: FoodItemViewModel(mealType: .breakfast, onSave: { _ in})
    )
}
