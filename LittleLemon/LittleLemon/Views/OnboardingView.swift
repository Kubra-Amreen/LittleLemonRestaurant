//
//  OnboardingView.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 7/24/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phoneNumber = ""
    @State var isLoggedIn: Bool = false
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HeaderView()
                    HeroView(searchText: .constant(""))
                    VStack(spacing: 10) {
                        NavigationLink(destination: HomeView(), isActive: $isLoggedIn) { EmptyView()}
                        Text("First Name *")
                            .OnboardingTextStyle()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("First Name", text: $firstName)
                        
                        Text("Last Name *")
                            .OnboardingTextStyle()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Last Name", text: $lastName)
                        
                        Text("Email *")
                            .OnboardingTextStyle()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            
                    }
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                                    
                    
                    Button("Register") {
                        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            UserDefaults.standard.set(true, forKey: kOrderStatuses)
                            UserDefaults.standard.set(true, forKey: kPasswordChanges)
                            UserDefaults.standard.set(true, forKey: kSpecialOffers)
                            UserDefaults.standard.set(true, forKey: kNewsletter)
                            firstName = ""
                            lastName = ""
                            email = ""
                            isLoggedIn = true
                        }  else {
                            debugPrint("Invalid details")
                            isLoggedIn = false
                        }
                        
                        
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())
                    .padding()
                    .frame(alignment: .center)
                    
                    Spacer()
                }
                .onAppear{
                    if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        isLoggedIn = true
                    }
                }
                
            }
        }
    }
}

#Preview {
    OnboardingView()
}
