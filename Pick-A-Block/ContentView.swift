import SwiftUI

struct ConfettiView: View {
    @State private var confettiParticles: [ConfettiParticle] = []
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .pink, .purple]
    let count: Int = 20
    let duration: Double = 0.8

    struct ConfettiParticle: Identifiable {
        let id = UUID()
        var x: CGFloat
        var y: CGFloat
        var color: Color
        var scale: CGFloat = 1
        var opacity: Double = 1
        var angle: Angle = .zero
    }

    var body: some View {
        GeometryReader { geo in
            ForEach(confettiParticles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: 10, height: 10)
                    .scaleEffect(particle.scale)
                    .opacity(particle.opacity)
                    .rotationEffect(particle.angle)
                    .position(x: particle.x, y: particle.y)
                    .animation(nil, value: particle.id)
            }
            .onAppear {
                confettiParticles.removeAll()
                for _ in 0..<count {
                    let startX = geo.size.width / 2
                    let startY = geo.size.height / 2
                    let randomX = CGFloat.random(in: -geo.size.width/2...geo.size.width/2)
                    let randomY = CGFloat.random(in: -geo.size.height/2...geo.size.height/2)
                    let color = colors.randomElement() ?? .red
                    var particle = ConfettiParticle(x: startX, y: startY, color: color)
                    confettiParticles.append(particle)
                }

                for i in confettiParticles.indices {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05 * Double(i)) {
                        withAnimation(.easeOut(duration: duration)) {
                            confettiParticles[i].x += CGFloat.random(in: -150...150)
                            confettiParticles[i].y += CGFloat.random(in: -300...0)
                            confettiParticles[i].scale = 0.1
                            confettiParticles[i].opacity = 0
                            confettiParticles[i].angle = Angle.degrees(Double.random(in: -360...360))
                        }
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + duration + 0.5) {
                    confettiParticles.removeAll()
                }
            }
        }
        .allowsHitTesting(false)
    }
}

struct ContentView: View {
    @State private var pickedNumber: Int? = nil
    @State private var colors: [String] = ["Gray", "Dark Blue", "Light Blue", "Green", "Black", "Yellow", "Purple"]
    @State private var numberofcolor: ClosedRange<Int> = 0...6
//    @State private var currentnumber: Int? = 6
    @State private var pickedColor: String? = nil
    
    @State private var showConfetti: Bool = false
    
    func color(for name: String) -> Color {
        switch name.lowercased() {
        case "gray": return .gray
        case "dark blue": return Color(red: 0.0, green: 0.01, blue: 0.9)
        case "light blue": return .cyan
        case "green": return .green
        case "black": return .black
        case "yellow": return .yellow
        case "purple": return Color(red: 157/255.0, green: 0/255.0, blue: 255/255.0)
        default: return .white
        }
    }
    
    func pickColorAndAnimate() {
        pickedNumber = Int.random(in: numberofcolor)
        pickedColor = colors[pickedNumber!]
//        showConfetti = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            showConfetti = false
//        }
    }
    
    var body: some View {
        ZStack {
            if let colorName = pickedColor {
                color(for: colorName)
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 0.5), value: pickedColor)
            }
            
            VStack(spacing: 24) {
                Text("Pick-A-Block")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .bold()
                    .padding(.top, 40)
                
                Spacer()
            }
            .padding()

//            if showConfetti {
//                ConfettiView()
//                    .transition(.opacity)
//                    .zIndex(1)
//            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            pickColorAndAnimate()
        }
    }
}
