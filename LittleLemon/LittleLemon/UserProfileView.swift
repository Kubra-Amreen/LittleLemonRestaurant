//
//  UserProfileView.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 7/31/24.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.presentationMode) var presentation
    
    //User Info
    @State private var firstName: String = (UserDefaults.standard.string(forKey: kFirstName) ?? "")
    @State private var lastName: String = (UserDefaults.standard.string(forKey: kLastName) ?? "")
    @State private var email: String = (UserDefaults.standard.string(forKey: kEmail) ?? "")
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder")
            Text(firstName)
            Text(lastName)
            Text(email)
            Button("logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfileView()
}
