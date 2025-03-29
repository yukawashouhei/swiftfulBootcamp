//
//  yugiocard.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/03/04.
//

import SwiftUI

struct HoloCardView: View {
    @State private var shimmerOffset: CGFloat = -200
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            // カードの背景 (茶色)
            RoundedRectangle(cornerRadius: 20) // 角を丸める
                .fill(Color(red: 0.6, green: 0.4, blue: 0.2)) // 茶色
                .frame(width: 300, height: 420)
                .shadow(radius: 5)

            // ホログラムエフェクト
            HologramEffect()
                .mask(
                    RoundedRectangle(cornerRadius: 20) // 角を丸める
                        .frame(width: 300, height: 420)
                )

            // 放射状の線
            ForEach(0..<36) { index in
                let angle = Double(index) * 10
                Line()
                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    .rotationEffect(.degrees(angle))
            }
            .frame(width: 400, height: 520) // 放射状の線の範囲
        }
        .onAppear {
            isAnimating = true
            withAnimation(Animation.linear(duration: 2.5).repeatForever(autoreverses: false)) {
                shimmerOffset = 200
            }
        }
    }
}

// ホログラムエフェクトのView
struct HologramEffect: View {
    @State private var shimmerOffset: CGFloat = -200
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color.white.opacity(0.1),
            Color.white.opacity(0.4),
            Color.white.opacity(0.1)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .blendMode(.screen)
        .mask(
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [
                    Color.clear, Color.white, Color.clear
                ]), startPoint: .leading, endPoint: .trailing))
                .rotationEffect(.degrees(30))
                .offset(x: shimmerOffset)
        )
        .onAppear {
            withAnimation(Animation.linear(duration: 2.5).repeatForever(autoreverses: false)) {
                shimmerOffset = 200
            }
        }
    }
}

// 放射状の線
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 0))
        return path
    }
}

struct ContentView: View {
    var body: some View {
        HoloCardView()
            .frame(width: 300, height: 420)
    }
}

#Preview {
    ContentView()
}
