import SwiftUI
import FortuneWheel

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        let r = Double((color >> 16) & 0xFF) / 255.0
        let g = Double((color >> 8) & 0xFF) / 255.0
        let b = Double(color & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct ContentView: View {
    
    private let hexColors: [Color] = [
        Color(hex: "00B9FF"),
        Color(hex: "20407A"),
        Color(hex: "FFF112"),
        Color(hex: "BB82FF"),
        Color(hex: "31B554"),
        Color(hex: "222222"),
        Color(hex: "5B5B5B")
    ]
    private var colors = ["Light Blue", "Dark Blue", "Yellow", "Purple", "Green", "Black", "Grey"]
    @State private var isPresented = false
    @State private var alertTitle = "Order Complete - 2"
    
    var body: some View {
        ZStack {
            VStack{
                Image("Banner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)                .offset(x: 0, y: -50)
                ZStack {
                    FortuneWheel(titles: colors, size: 320,
                                 onSpinEnd: onSpinEnd,
                                 colors: hexColors)
                }
                //                         getWheelItemIndex: getWheelItemIndex
            }
            if isPresented {
                CustomDialog(isActive: $isPresented, title: "You've picked a color!", message: "\(alertTitle)", buttonTitle: "Ok") {
                    print("Pass to viewModel")
                }
            }
        }
    }

    private func onSpinEnd(index: Int) {
        alertTitle = "The color you picked is: \(colors[index])"
        // your action here - based on index
        isPresented = true
    }

//    private func getWheelItemIndex() -> Int {
//        return getIndexFromAPI()
//    }
    
    
}
