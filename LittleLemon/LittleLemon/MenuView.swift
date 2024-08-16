//
//  Menu.swift
//  LittleLemon
//
//  Created by Kubra Amreen on 7/25/24.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var loaded: Bool = false
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                Spacer()
            TextField("Search menu", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding()
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) {dish in
                        VStack {
                            HStack {
                                Text(dish.title ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                Spacer()
                                Text(dish.price ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(maxWidth: 90, maxHeight: 90)
                                .clipShape(Rectangle())
                            }
                            Text(dish.dishDescription ?? "")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .onAppear {
            if !loaded {
                MenuList.getMenuData(viewContext: viewContext)
                loaded = true
            }
        }
        .padding()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

#Preview {
    MenuView()
}
