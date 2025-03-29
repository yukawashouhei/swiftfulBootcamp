//
//  TextfieldBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/03/18.
//

import SwiftUI

struct TextfieldBootcamp: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack { // 全体を VStack で囲む
            TextField("Type something here...", text: $textFieldText)
                .padding()
                .frame(maxWidth: .infinity) // 最大幅まで広げる
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .foregroundColor(.red)
                .font(.headline)
                .padding(.horizontal) // 左右の padding を追加

            Button(action: {
                // TODO: Save action
                print("Save button tapped with text: \(textFieldText)") //確認用
            }, label: {
                Text("Save".uppercased())
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity) // 最大幅まで広げる
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.cornerRadius(10))
                    .font(.headline)
            })
            .padding(.horizontal) // 左右の padding を追加

            Spacer()
        }
        .padding() // VStack 全体のPadding
    }
}

#Preview {
    TextfieldBootcamp()
}
