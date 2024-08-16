//
//  HomeView.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 7/25/24.
//

import SwiftUI

struct HomeView: View {
    let persistence = PersistenceController.shared
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .environment(\.managedObjectContext, persistence.container.viewContext)
            UserProfileView()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
        }
        .navigationBarBackButtonHidden(true)
      
    }
}

#Preview {
    HomeView()
}
