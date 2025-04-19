//
//  ModelBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/04/17.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let username: String
    let followersCount: Int
    let isVerified: Bool
}

struct ModelBootcamp: View {
    
    @State var users : [UserModel] = [
        UserModel(displayName: "Nick", username: "nick123", followersCount: 100, isVerified: true ),
        UserModel(displayName: "Emly", username: "itemily", followersCount: 55, isVerified: false),
        UserModel(displayName: "Samantha", username: "Ninja", followersCount: 500, isVerified: true),
        UserModel(displayName: "Chris", username: "Chris2009", followersCount: 88, isVerified: false),
        
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Image(systemName: "person.crop.circle")
                            .resizable() // サイズ変更可能にする
                            .scaledToFit() // アスペクト比を保ってフレームに収める
                            .frame(width: 35, height: 35) // サイズを指定
                            .foregroundStyle(.gray) // 色を指定 (任意)
                        
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.username)")
                                .foregroundStyle(.secondary)
                                .font(.caption)
                        }
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followersCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundStyle(.secondary)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ModelBootcamp()
}
