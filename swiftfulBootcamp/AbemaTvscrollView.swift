//
//  AbemaTvscrollView.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/03/03.
//

import SwiftUI

struct AbemaLikeScrollView: View {
    let categories = ["ニュース", "アニメ", "映画", "ドラマ", "スポーツ", "バラエティ"]

    let samplePrograms: [Program] = [
        Program(title: "番組A", imageName: "1"),
        Program(title: "番組B", imageName: "2"),
        Program(title: "番組C", imageName: "3"),
        Program(title: "番組D", imageName: "4"),
        Program(title: "番組E", imageName: "5")
    ]

    @State private var searchText = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // ヘッダー
                HStack {
                    Text("ABEMA")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Spacer()

                    Image(systemName: "magnifyingglass")
                    Image(systemName: "line.3.horizontal")
                }
                .padding()

                // カテゴリリスト
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .font(.headline)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }

                // コンテンツ (番組リスト)
                ForEach(categories, id: \.self) { category in
                    VStack(alignment: .leading) {
                        Text(category)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(samplePrograms) { program in
                                    ProgramCardView(program: program)
                                        .frame(width: 150)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
        .background(Color.white)
    }
}

struct ProgramCardView: View {
    let program: Program

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.blue)
                .aspectRatio(9 / 16, contentMode: .fill) // アスペクト比を適用
                .frame(width: 150) // 幅を固定
                .clipped() // はみ出した部分を切り取る
                .overlay(
                    Text(program.imageName) // 数字を表示
                        .font(.largeTitle)
                        .foregroundColor(.white)
                )
                .cornerRadius(10)

            Text(program.title)
                .font(.subheadline)
                .lineLimit(2)
        }
    }
}

struct Program: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

#Preview {
    AbemaLikeScrollView()
}
