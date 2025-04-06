import SwiftUI

struct SliderBootcamp: View {
    @State var sliderValue: Double = 3.0
    @State var textColor: Color = .red
    @State var isEditing: Bool = false
    
    var body: some View {
        VStack {
            Text("Rating")
                .font(.title)
            
            Text(String(format: "%.1f", sliderValue))
                .font(.headline)
                .foregroundColor(isEditing ? .green : .red)
            
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { editing in
                    isEditing = editing
                    print("Slider editing changed: \(editing)")
                },
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("5"),
                label: {
                    Text("Rating Slider")
                }
            )
            .accentColor(.red)
            .padding(.horizontal)
            
        }
        .padding()
    }
}

#Preview {
    SliderBootcamp()
}
