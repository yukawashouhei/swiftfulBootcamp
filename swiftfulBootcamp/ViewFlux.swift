//
//  ViewFlux.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/03/03.
//

import SwiftUI

// 状態 (State)
struct appstate {
    var count = 0
}

// アクション (Action)
enum AppAction {
    case increment
    case decrement
}

// 状態を変更する関数 (Reducer の代わり)
func updateState(state: inout AppState, action: AppAction) {
    switch action {
    case .increment:
        state.count += 1
    case .decrement:
        state.count -= 1
    }
}

// View
struct ViewFlux: View {
    @State private var state = AppState() // 状態を管理
    
    var body: some View {
        VStack {
            Text("Count: \(state.count)")
            HStack {
                Button("Increment") {
                    updateState(state: &state, action: .increment) // アクションを発行
                }
                Button("Decrement") {
                    updateState(state: &state, action: .decrement) // アクションを発行
                }
            }
        }
    }
}

#Preview {
    ViewFlux()
}
