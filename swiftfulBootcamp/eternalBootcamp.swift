//
//  eternalBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/03/02.
//

import SwiftUI

struct eternalBootcamp: View {
    @State private var isDarkMode = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(1...20, id: \.self) { number in
                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        
                        Text("\(number)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .scrollTargetBehavior(.paging)
        .scrollTargetLayout()
    }
}

#Preview {
    eternalBootcamp()
}
