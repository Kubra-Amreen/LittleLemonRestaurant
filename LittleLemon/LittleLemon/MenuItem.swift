//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 8/1/24.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var price: String
    var dishDescription: String?
    var category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case dishDescription = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
