//
//  MenuList.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 8/1/24.
//

import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    
    static func getMenuData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
      
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                    for dish in fullMenu.menu {
                            let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.price = dish.price
                        newDish.image = dish.image
                        newDish.dishDescription = dish.dishDescription
                        newDish.category = dish.category
                    }
                    try? viewContext.save()
                    
                } else {
                    print(error.debugDescription.description)
                }
                
            } else {
                print(error.debugDescription.description)
            }
            
        }
        dataTask.resume()
        
    }
}
