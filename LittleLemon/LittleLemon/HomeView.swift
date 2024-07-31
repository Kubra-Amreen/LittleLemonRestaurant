//
//  HomeView.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 7/25/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfileView()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
        }
        .navigationBarBackButtonHidden(true)
      
    }
}

#Preview {
    HomeView()
}
