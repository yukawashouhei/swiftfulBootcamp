//
//  StepperBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/04/05.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthIncrement,height: 100)
            
            Stepper("Stepper 2") {
                widthIncrement += 10
                incrementWidth(amount: 50)
            } onDecrement: {
                incrementWidth(amount: -50)
            }
            .padding(50)
        }
    }
    func incrementWidth (amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

#Preview {
    StepperBootcamp()
}
