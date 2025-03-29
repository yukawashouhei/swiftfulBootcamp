//
//  chidousetsu.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/03/08.
//

import SwiftUI

struct SolarSystemView: View {
    let planetData: [(name: String, radiusFactor: CGFloat, speed: Double, color: Color, sizeFactor: CGFloat)] = [
        ("Mercury", 0.15, 1.0, .white, 0.030),   // 水星（小さいまま）
        ("Venus", 0.25, 0.75, .white, 0.033),    // 金星（小さいまま）
        ("Earth", 0.35, 0.6, .blue, 0.045),      // 地球（青・大きめ）
        ("Mars", 0.45, 0.5, .white, 0.035),     // 火星（小さいまま）
        ("Jupiter", 0.6, 0.4, .white, 0.035),    // 木星（小さいまま）
        ("Saturn", 0.75, 0.3, .white, 0.035),    // 土星（小さいまま）
        ("Uranus", 0.9, 0.2, .white, 0.035),     // 天王星（小さいまま）
        ("Neptune", 1.05, 0.15, .white, 0.035)   // 海王星（小さいまま）
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let minSize = min(geometry.size.width, geometry.size.height)
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let maxRadius = minSize * 0.45  // 軌道の最大半径
            let sunSize = minSize * 0.09    // 太陽のサイズ（固定）
            
            TimelineView(.animation(minimumInterval: 0.02)) { timeline in
                let time = timeline.date.timeIntervalSinceReferenceDate
                
                ZStack {
                    // 背景（K80 C100の濃い青）
                    Color(red: 0.0, green: 0.08, blue: 0.3)
                        .edgesIgnoringSafeArea(.all)
                    
                    // 軌道の描画
                    ForEach(planetData, id: \.name) { planet in
                        Circle()
                            .stroke(Color.white, lineWidth: 1)
                            .frame(width: maxRadius * planet.radiusFactor * 2,
                                   height: maxRadius * planet.radiusFactor * 2)
                    }
                    
                    // 太陽（赤、Sマーク白）
                    Circle()
                        .fill(Color.red)
                        .frame(width: sunSize)
                        .overlay(Text("S").foregroundColor(.white).bold())
                    
                    // 惑星の描画（地球のみサイズ調整）
                    ForEach(planetData, id: \.name) { planet in
                        let angle = time * planet.speed
                        let radius = maxRadius * planet.radiusFactor
                        let x = center.x + radius * cos(angle)
                        let y = center.y + radius * sin(angle)
                        
                        ZStack {
                            Circle()
                                .fill(planet.color)
                                .frame(width: minSize * (planet.name == "Earth" ? 0.07 : planet.sizeFactor))  // 地球だけ大きく
                            
                            if planet.name == "Earth" {
                                Text("T")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        .position(x: x, y: y)
                    }
                }
            }
        }
    }
}

#Preview {
    SolarSystemView()
}
