//
//  VIewModelBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/04/19.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

struct VIewModelBootcamp: View {
    
    @State var fruitArray: [FruitModel] = [
        FruitModel(name: "Apples", count: 5)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruitArray) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundStyle(.red)
                        Text(fruit.name)
                            .font(.headline)
                            .bold()
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .onAppear {
                getFruits()
            }
        }
    }
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 28)
        let fruit4 = FruitModel(name: "Strawberry", count: 8)
        
        fruitArray.append(fruit1)
        fruitArray.append(fruit2)
        fruitArray.append(fruit3)
        fruitArray.append(fruit4)
    }
}


#Preview {
    VIewModelBootcamp()
}
