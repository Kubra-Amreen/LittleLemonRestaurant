//
//  HeroView.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 8/18/24.
//

import SwiftUI

struct HeroView: View {
    @State var isHomeScreen: Bool = false
    @Binding var searchText: String
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Little Lemon")
                        .foregroundColor(Color.primaryColor2)
                        .font(.displayFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Chicago")
                        .foregroundColor(.white)
                        .font(.subTitleFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer(minLength: 5)
                    Text("""
                     We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                     """)
                    .foregroundColor(.white)
                    .font(.leadText())
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                Image("HeroImage")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 140)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
            .padding(.bottom, 10)
            
            if isHomeScreen {
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
            }
        }
        .padding()
        .background(Color.primaryColor1)
        .frame(maxWidth: .infinity, maxHeight: 240)
    }
}

#Preview {
    HeroView(searchText: .constant(""))
}
