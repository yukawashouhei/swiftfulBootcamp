import SwiftUI

struct SynchronizedScrollView: View {
    @State private var scrollOffset: CGFloat = 0
    private let cellHeight: CGFloat = 150
    private let scaleFactor: CGFloat = 3 // 縮小率
    private let colorCount = 50 // 色の数
    let bottomViewHeight: CGFloat = 160
    let bottomViewWidth: CGFloat = 90

    private let colors: [Color] = (0..<50).map { _ in
        Color(hue: Double.random(in: 0...1), saturation: 0.7, brightness: 0.9)
    }

    var body: some View {
        GeometryReader { geometry in
            let topViewHeight = geometry.size.height * (2/3)

            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    // 上部のスクロールビュー（画面の2/3を覆う）
                    ScrollViewReader { topProxy in
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 0) {
                                ForEach(colors.indices, id: \.self) { index in
                                    colors[index]
                                        .frame(height: cellHeight)
                                        .id(index)
                                }
                            }
                            .background(GeometryReader { proxy in
                                Color.clear
                                    .preference(key: ScrollOffsetKey.self, value: proxy.frame(in: .global).minY)
                            })
                        }
                        .frame(height: topViewHeight)
                        .onPreferenceChange(ScrollOffsetKey.self) { value in
                            scrollOffset = value
                        }
                    }

                    Spacer()
                }
                Rectangle()
                    .fill(.black)
                    .frame(width: bottomViewWidth, height: bottomViewHeight)
                    .overlay(
                        VStack{
                            ForEach(colors.indices, id: \.self) { index in
                                colors[index]
                                    .frame(height: cellHeight/scaleFactor)
                                    
                            }
                        }
                            .scaleEffect(0.3)
                        .offset(y:scrollOffset / scaleFactor)
                        
                    )
                   
            }
        }
    }
}

// スクロールオフセット取得用キー
struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ContentView: View {
    var body: some View {
        SynchronizedScrollView()
    }
}

#Preview {
    ContentView()
}
