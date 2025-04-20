//
//  EnvironmentObjectBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/04/20.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}

struct EnvironmentObjectBootcamp: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(
                        destination: DetailView(selectedItem: item),
                        label: {
                            Text(item)
                        })
                    
                }
            }
            .navigationTitle("iOS Devices")
        }
    }
}

struct DetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            //background
            Color.orange.ignoresSafeArea()
            
            //foreground
            Text(selectedItem)
                .font(.headline)
                .foregroundStyle(.orange)
                .padding()
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
        }
    }
}

struct FinalView: View {
    
    var body: some View {
        //background
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0, green: 1, blue: 0.5, opacity: 1.0),
                    Color(red: 0.2, green: 0.8, blue: 1.0, opacity: 0.9)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing:20)
                {
                    Text("Item1")
                    Text("Item2")
                    Text("Item3")
                }
                .foregroundStyle(.black)
                .font(.title)
                .opacity(0.6)
                .padding(.top, 50)
            }
        }
    }
}

#Preview {
    EnvironmentObjectBootcamp()
    //        DetailView(selectedItem: "iPhone")
    FinalView()
}
