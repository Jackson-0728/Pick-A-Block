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
        Color(hex: "3F8BBD"),
        Color(hex: "20407A"),
        Color(hex: "CBB743"),
        Color(hex: "65588A"),
        Color(hex: "227D51"),
        Color(hex: "222222"),
        Color(hex: "5B5B5B")
    ]
    private var colors = ["Light Blue", "Dark Blue", "Yellow", "Purple", "Green", "Black", "Grey"]
    
    var body: some View {
//        let model = FortuneWheelModel(
//            titles: players, size: 320,
//            onSpinEnd: onSpinEnd,
//            getWheelItemIndex: getWheelItemIndex
//        )
        VStack{
            Text("Pick-A-Block")
                .font(.title)
                .padding()
            ZStack {
                FortuneWheel(titles: colors, size: 320,
                             onSpinEnd: onSpinEnd,
                             colors: hexColors)
                
                             //                         getWheelItemIndex: getWheelItemIndex
            }
        }
    }

    private func onSpinEnd(index: Int) {
        // your action here - based on index
    }

//    private func getWheelItemIndex() -> Int {
//        return getIndexFromAPI()
//    }
}
