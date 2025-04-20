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
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
    
    let selectedItem: String
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            //background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0, green: 1, blue: 0.5, opacity: 1.0), // 色1
                    Color(red: 0.2, green: 0.8, blue: 1.0, opacity: 0.9)  // 色2
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            //foreground
            NavigationLink(
                destination: FinalView(),
                label: {
                    Text(selectedItem)
                        .font(.headline)
                        .foregroundStyle(Gradient(colors: [
                            Color(red: 0, green: 1, blue: 0.5, opacity: 1.0),
                            Color(red: 0.2, green: 0.8, blue: 1.0, opacity: 0.9)
                        ]))
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(20)
                })
        }
    }
}

struct FinalView: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
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
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)}
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
    //    FinalView()
}
