import SwiftUI

// 1. 各タブを表すEnum (タイプセーフなタグとして使用)
// CaseIterable: ForEachで全ケースを反復処理するため
// Identifiable: ForEachで一意に識別するため
enum Tab: Int, CaseIterable, Identifiable {
    case home = 0
    case browse = 1
    case profile = 2
    case setting = 3

    // Identifiableに準拠するためにidを定義 (ここではrawValueを使用)
    var id: Int { self.rawValue }
}

// 2. タブに関するすべてのデータを保持する構造体
struct TabInfo {
    let tab: Tab            // 対応するタブのEnumケース
    let title: String       // タブバーに表示するタイトル
    let iconName: String    // タブバーに表示するSF Symbolsの名前 (非塗りつぶし版)
    let selectedColor: Color // このタブが選択された時の色
    let contentBgColor: Color // このタブのコンテンツエリアの背景色
    let contentText: String   // このタブのコンテンツエリアに表示する主要テキスト
}

struct TabViewBootcampRefactored: View {

    // 選択されているタブの状態を保持 (Enumを使用)
    @State private var selectedTab: Tab = .home // 初期選択はホーム
    // 非選択時のタブアイテムの色
    private let unselectedColor: Color = .black
    // コンテンツ下部に追加する白いバーの高さ
    private let bottomBarHeight: CGFloat = 20

    // 3. すべてのタブの設定データを一元管理する配列
    private let tabItems: [TabInfo] = [
        TabInfo(tab: .home, title: "Home", iconName: "house", selectedColor: .yellow, contentBgColor: .yellow.opacity(0.3), contentText: "HOME TAB"),
        TabInfo(tab: .browse, title: "Browse", iconName: "globe", selectedColor: .red, contentBgColor: .red.opacity(0.3), contentText: "BROWSE TAB"),
        TabInfo(tab: .profile, title: "Profile", iconName: "person", selectedColor: .blue, contentBgColor: .blue.opacity(0.3), contentText: "PROFILE TAB"),
        TabInfo(tab: .setting, title: "Setting", iconName: "gearshape", selectedColor: .purple, contentBgColor: .purple.opacity(0.3), contentText: "SETTING TAB")
    ]

    // タブバーの外観を設定 (View構造体の初期化時に一度だけ実行される)
    init() {
        let appearance = UITabBarAppearance()
        // 不透明な背景で設定を開始
        appearance.configureWithOpaqueBackground()
        // 背景色を白に設定
        appearance.backgroundColor = UIColor.white
        // タブバー上部の境界線(影)を削除
        appearance.shadowColor = nil

        // 非選択時のアイテムの外観を設定 (定数を使用)
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(unselectedColor)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(unselectedColor)]

        // ★★★ 選択時の色の設定は Appearance では行わない ★★★
        // (ここで設定すると .tint() による動的変更と競合する可能性があるため)
        // appearance.stackedLayoutAppearance.selected.iconColor = ...
        // appearance.stackedLayoutAppearance.selected.titleTextAttributes = ...


        // 設定した外観をデフォルト(standard)とスクロールエッジ(scrollEdge)に適用
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    // ★★★ 現在選択されているタブの色を返す計算プロパティ ★★★
    private var currentTintColor: Color {
        // tabItems配列から、現在選択されているselectedTabと一致する要素を探す
        // 見つかった要素のselectedColorを返す。見つからなければデフォルト色(例: 青)を返す
        tabItems.first(where: { $0.tab == selectedTab })?.selectedColor ?? .accentColor // .accentColorはシステムのデフォルト色
    }

    var body: some View {
        // 選択状態をEnumとバインド
        TabView(selection: $selectedTab) {
            // 4. ForEachを使用してタブデータを反復処理し、繰り返しを削減
            ForEach(tabItems, id: \.tab) { item in
                // 各タブのコンテンツViewを生成
                TabContentView(
                    text: item.contentText,
                    bgColor: item.contentBgColor,
                    currentTab: selectedTab, // 選択中のタブ(Enum)を渡す
                    bottomBarHeight: bottomBarHeight // 白いバーの高さを渡す
                )
                // 各コンテンツViewに対応するタブバーアイテムを設定
                .tabItem {
                    // ヘルパー関数を呼び出してタブアイテムのラベルを生成
                    tabItemLabel(for: item)
                }
                // 各コンテンツViewにEnumケースをタグとして設定
                .tag(item.tab)
            }
        }
        // ★★★ TabView全体に .tint() を適用し、選択色を動的に変更 ★★★
        .tint(currentTintColor)
    }

    // 5. タブアイテムのラベルを一貫して生成するためのヘルパー関数 (@ViewBuilderを使用)
    @ViewBuilder
    private func tabItemLabel(for item: TabInfo) -> some View {
        Label(item.title, systemImage: item.iconName)
            // 選択されているタブのアイコンのみ塗りつぶし(.fill)にする
            .environment(\.symbolVariants, selectedTab == item.tab ? .fill : .none)
            // ★★★ ここでの .foregroundColor 設定は削除 ★★★
            // (選択色は .tint() で制御するため)
            // .foregroundColor(selectedTab == item.tab ? item.selectedColor : unselectedColor)
    }
}

// TabContentViewもEnumと高さ定数を受け入れるように更新
struct TabContentView: View {
    let text: String
    let bgColor: Color
    let currentTab: Tab // Enumタイプを使用
    let bottomBarHeight: CGFloat // 定数を使用

    var body: some View {
        ZStack(alignment: .bottom) {
            // 背景色 (上端と左右はセーフエリアを無視)
            bgColor
                .ignoresSafeArea(.all, edges: [.top, .horizontal])

            // メインコンテンツ部分
            VStack {
                Spacer() // 上下のSpacerで中央寄せ
                Text(text).font(.headline)
                // デバッグ用に現在のタブのrawValueを表示 (任意)
                Text("Selected Tab: \(currentTab.rawValue)")
                Spacer()
            }
            //可能な限り最大のサイズを取り、コンテンツを下部の白いバーにかぶらないように底上げ
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, bottomBarHeight) // 定数を使用

            // 下部の白いバー
            Rectangle()
                .fill(.white)
                .frame(maxWidth: .infinity)
                .frame(height: bottomBarHeight) // 定数を使用
        }
    }
}

#Preview {
    // 新しい構造体名でプレビュー
    TabViewBootcampRefactored()
}
