import SwiftUI
import FortuneWheel

struct ContentView: View {

    private var players = ["Sameer", "Spikey", "Amelia", "Danny", "Karen", "Kathy"]
    private var colors = ["#3F8BBD", "#20407A", "#CBB743", "#65588A", "#227D51", "#222", "#5B5B5B"]
    
    var body: some View {
//        let model = FortuneWheelModel(
//            titles: players, size: 320,
//            onSpinEnd: onSpinEnd,
//            getWheelItemIndex: getWheelItemIndex
//        )
        VStack{
            ZStack {
                FortuneWheel(titles: players, size: 320,
                             onSpinEnd: onSpinEnd,
                             //                         getWheelItemIndex: getWheelItemIndex
                )
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
