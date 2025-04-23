//
//  IntroView.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/04/23.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("currentUserSignedIn") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            //background
            RadialGradient(gradient: Gradient(colors: [.purple, .blue]),
                           center: .topLeading,
                           startRadius: 5,
                           endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            if currentUserSignedIn {
                Text("Profile View")
            } else {
                Text("Onboarding View")
                
            }
            
        }
    }
}

#Preview {
    IntroView()
}
