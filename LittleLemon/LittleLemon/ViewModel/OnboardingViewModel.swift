//
//  OnboardingViewModel.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 8/18/24.
//

import Foundation

let kFirstName = "Fist name key"
let kLastName = "Last name key"
let kEmail = "Email key"
let kIsLoggedIn = "isLoggedIn key"
public let kPhoneNumber = "phone number key"

public let kOrderStatuses = "order statuses key"
public let kPasswordChanges = "password changes key"
public let kSpecialOffers = "special offers key"
public let kNewsletter = "news letter key"

class ViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Published var phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    
    @Published var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
    @Published var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
    @Published var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @Published var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    
}
