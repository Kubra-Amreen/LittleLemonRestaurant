//
//  OnboardingView.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 7/24/24.
//

import SwiftUI

enum NavigationItem {
    case home
    case profile
}

let kFirstName = "Fist name key"
let kLastName = "Last name key"
let kEmail = "Email key"
let kIsLoggedIn = "isLoggedIn key"

struct OnboardingView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn: Bool = false
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    NavigationLink(destination: HomeView(), isActive: $isLoggedIn) { EmptyView()}
                    Text("First Name")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("First Name", text: $firstName)
                        .padding()
                    Text("Last Name")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Last Name", text: $lastName)
                        .padding()
                    Text("Email")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .padding()
                }
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        firstName = ""
                        lastName = ""
                        email = ""
                        isLoggedIn = true
                    }  else {
                        debugPrint("Invalid details")
                        isLoggedIn = false
                    }
                    
                    
                }
                .padding()
                .frame(alignment: .center)
            }
            .padding()
            .onAppear{
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
            
        }
        
    }
}

#Preview {
    OnboardingView()
}
