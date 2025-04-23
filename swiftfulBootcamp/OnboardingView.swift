//
//  OnboardingView.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/04/23.
//

import SwiftUI

// extension OnboardingView { } // 不要なら削除

struct OnboardingView: View {

    // OnboardingState (省略)
    @State var onboardingState: Int = 1 // 初期値を1に設定

    // ★★★ TextField用の状態変数をここで宣言 ★★★
    @State var name: String = ""

    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea() // 背景を全体に

            //content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                case 1:
                    addNameSection // ★★★ ここで addNameSection を呼び出す ★★★
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.green)
                        .padding()
                }
            }

            //button
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
    }

    // bottomButton (変更なし)
    private var bottomButton: some View {
        Text("Sign in") // ← ボタンのテキストは状態によって変えるべきかも？
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                // ボタンタップ時の処理 (例: 状態を進める)
                // onboardingState += 1
            }
    }

    // welcomeSection (変更なし)
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.white)
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                    , alignment: .bottom
                )
            Text("This is the #1 app fo find your match online ! In this tutorial  we are practicing using AppStorage and other SwiftUI techniques.")
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }

    // ★★★ addNameSection を算出プロパティとして定義 ★★★
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)

            // ★★★ @State変数をバインド ★★★
            TextField("Enter your name", text: $name)
                .font(.headline) // フォント指定（任意）
                .frame(height: 55)
                .padding(.horizontal) // 内側に余白（任意）
                .background(Color.white) // 背景を白に（任意）
                .cornerRadius(10) // 角丸（任意）
                .padding(.horizontal) // 左右に余白（任意）

            Spacer()
            Spacer()
        }
        // .multilineTextAlignment(.center) // VStackには不要
        .padding(30)
    } // <- addNameSection の閉じ括弧

} // <- struct OnboardingView の閉じ括弧

#Preview {
    OnboardingView()
}
