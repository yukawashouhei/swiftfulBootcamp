//
//  alertBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/03/02.
//

//
//  alertBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/03/02.
//

import SwiftUI

struct alertBootcampView: View {

    @State var showAlert: Bool = false
    @State var backgroundColor: Color = Color.yellow

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)

            Button("Click here") {
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert, content: {
                getAlert()
            })
        }
    }

    func getAlert() -> Alert {
        return  Alert(
            title: Text("This is the title!"),
            message: Text("Here we will describe the error."),
            primaryButton: .destructive(Text("DELETE"), action: {
                backgroundColor = .red
            }),
            secondaryButton: .cancel()
        )
    }
}

#Preview {
    alertBootcampView()
}
