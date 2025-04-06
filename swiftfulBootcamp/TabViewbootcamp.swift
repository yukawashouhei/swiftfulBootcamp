import SwiftUI

struct TabViewbootcamp: View {

    @State private var selectedTab: Int = 0
    let unselectedColor: Color = .black
    let tabColors: [Color] = [.yellow, .red, .blue, .purple]

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()

        // 1. 背景色を白に変更
        appearance.backgroundColor = UIColor.white

        // 2. タブバー上部の境界線（影）を削除
        appearance.shadowColor = nil // または appearance.shadowImage = UIImage()

        // 非選択時のアイテムの色を設定 (黒)
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(unselectedColor)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(unselectedColor)]

        // 外観を適用
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            TabContentView(text: "HOME TAB", bgColor: tabColors[0].opacity(0.3), currentTab: $selectedTab)
                .tabItem {
                    Label("Home", systemImage: "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        .foregroundColor(selectedTab == 0 ? tabColors[0] : unselectedColor)
                }
                .tag(0)

            TabContentView(text: "BROWSE TAB", bgColor: tabColors[1].opacity(0.3), currentTab: $selectedTab)
                .tabItem {
                    Label("Browse", systemImage: "globe")
                         .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        .foregroundColor(selectedTab == 1 ? tabColors[1] : unselectedColor)
                }
                .tag(1)

            TabContentView(text: "PROFILE TAB", bgColor: tabColors[2].opacity(0.3), currentTab: $selectedTab)
                .tabItem {
                    Label("Profile", systemImage: "person")
                         .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                        .foregroundColor(selectedTab == 2 ? tabColors[2] : unselectedColor)
                }
                .tag(2)

            TabContentView(text: "SETTING TAB", bgColor: tabColors[3].opacity(0.3), currentTab: $selectedTab)
                .tabItem {
                    Label("Setting", systemImage: "gearshape")
                         .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        .foregroundColor(selectedTab == 3 ? tabColors[3] : unselectedColor)
                }
                .tag(3)
        }
    }
}

struct TabContentView: View {
    let text: String
    let bgColor: Color
    @Binding var currentTab: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            bgColor
                .ignoresSafeArea(.all, edges: [.top, .horizontal])

            VStack {
                Spacer()
                Text(text).font(.headline)
                Text("Selected Tab Tag: \(currentTab)")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 20)

            Rectangle()
                .fill(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 20)
        }
    }
}

#Preview {
    TabViewbootcamp()
}
