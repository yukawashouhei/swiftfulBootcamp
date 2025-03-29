//
//  appstate.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/03/03.
//

import SwiftUI

// 1. State (TCA ではなく、@State を使用)
struct AppState {
    var count: Int = 0
}

// 2. View (TCA を使用しない)
struct appstateView: View {
    @State private var state = AppState() // @State で状態を管理

    var body: some View {
        VStack {
            Text("Count: \(state.count)")
            HStack {
                Button("Increment") {
                    state.count += 1 // 直接状態を変更
                }
                Button("Decrement") {
                    state.count -= 1 // 直接状態を変更
                }
            }
        }
    }
}

#Preview {
    appstateView()
}
