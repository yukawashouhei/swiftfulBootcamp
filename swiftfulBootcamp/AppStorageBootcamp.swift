//
//  AppStorageBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/04/20.
//

import SwiftUI

struct AppstorageBootcamp: View {

    // UserDefaults の "isDarkMode" キーに Bool 型で保存。初期値は false
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    // UserDefaults の "tapCount" キーに Int 型で保存。初期値は 0
    @AppStorage("tapCount") var tapCount: Int = 0

    var body: some View {
        NavigationView { // ナビゲーションバーを表示するため
            VStack(spacing: 30) { // 要素間のスペースを広めに取る

                // ユーザー名表示と入力


                Divider() // 区切り線

                // ダークモード設定
                Toggle("ダークモードを有効にする", isOn: $isDarkMode) // $ でバインディング
                    .padding(.horizontal)

                Divider() // 区切り線

                // タップ回数カウンター
                VStack {
                    Text("ボタンのタップ回数:")
                    Text("\(tapCount)")
                        .font(.largeTitle.bold()) // 数字を大きく太字に

                    Button("回数を増やす") {
                        tapCount += 1 // ボタンを押すとカウントが増え、自動保存される
                    }
                    .buttonStyle(.borderedProminent) // 目立つボタンスタイル
                }

                Spacer() // 残りのスペースを埋める
            }
            .navigationTitle("AppStorage学習") // ナビゲーションバーのタイトル
            // isDarkMode の値に応じて、アプリ全体のカラースキームを切り替える
            // これにより、Toggleの変更が即座に見た目に反映される
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    AppstorageBootcamp()
}
