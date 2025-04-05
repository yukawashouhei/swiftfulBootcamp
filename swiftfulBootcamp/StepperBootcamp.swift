//
//  StepperBootcamp.swift
//  swiftfulBootcamp
//
//  Created by 湯川昇平 on 2025/04/05.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue: Int = 10
    
    var body: some View {
        Stepper("Stepper", value: $stepperValue)
    }
}

#Preview {
    StepperBootcamp()
}
