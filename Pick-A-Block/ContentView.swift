import SwiftUI
import FortuneWheel

struct ContentView: View {

    private var players = ["Sameer", "Spikey", "Amelia", "Danny", "Karen", "Kathy"]
    
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
