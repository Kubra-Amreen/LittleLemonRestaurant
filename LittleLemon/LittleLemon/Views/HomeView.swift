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
        VStack {
            HeaderView()
            MenuView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
        .navigationBarBackButtonHidden(true)
      
    }
}

#Preview {
    HomeView()
}
