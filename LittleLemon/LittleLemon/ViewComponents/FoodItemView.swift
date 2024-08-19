//
//  FoodItemView.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 8/18/24.
//

import SwiftUI

struct FoodItemView: View {
    let dish: Dish
    var body: some View {
            HStack {
                VStack {
                    Text(dish.title ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.sectionCategories())
                        .foregroundColor(.black)
                    Spacer(minLength: 10)
                    Text(dish.dishDescription ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.paragraphText())
                        .foregroundColor(.primaryColor1)
                        .lineLimit(2)
                    Spacer(minLength: 5)
                    Text("$" + (dish.price ?? ""))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.highlightText())
                        .foregroundColor(.primaryColor1)
                        .monospaced()
                }
                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: 90, maxHeight: 90)
                .clipShape(Rectangle())
            }
            .padding(.vertical)
            .frame(maxHeight: 150)
        }
}

#Preview {
    FoodItemView(dish: PersistenceController.oneDish())
}
