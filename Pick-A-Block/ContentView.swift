import SwiftUI

struct ContentView: View {
    @State private var pickedNumber: Int? = nil
    @State private var colors: [String] = ["Gray", "Dark Blue", "Light Blue", "Green", "Black", "Yellow", "System Blue"]
    @State private var numberofcolor: ClosedRange<Int> = 0...6
    @State private var pickedColor: String? = nil
    
    func color(for name: String) -> Color {
        switch name.lowercased() {
        case "gray": return .gray
        case "dark blue": return Color(red: 0.2, green: 0.2, blue: 0.6)
        case "light blue": return Color(red: 0.6, green: 0.8, blue: 1.0)
        case "green": return .green
        case "black": return .black
        case "yellow": return .yellow
        case "system blue": return .blue
        default: return .white
        }
    }
    
    var body: some View {
        ZStack {
            if let colorName = pickedColor {
                color(for: colorName)
                    .ignoresSafeArea()
            } else {
                Color.white.ignoresSafeArea()
            }
            VStack(spacing: 24) {
                Text("Pick-A-Block")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .bold()
                    .padding(.top, 40)


                Button(action: {
                    pickedNumber = Int.random(in: numberofcolor)
                    pickedColor = colors[pickedNumber!]
                }) {
                    Text("Pick a Color")
                        .font(.title2)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 16)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                .padding(.top, 16)

                Spacer()
            }
            .padding()
        }
    }
}
