import SwiftUI

struct MeditationCloudsView: View {
    struct CloudConfig {
        var height: CGFloat
        var width: CGFloat
        var yPosition: CGFloat
        var animationDuration: Double
        var animationDelay: Double
    }
    
    // Hard coded positions for the clouds
    private let clouds: [CloudConfig] = [
        CloudConfig(height: 200, width: 270, yPosition: 50, animationDuration: 7.0, animationDelay: 0.0),
        CloudConfig(height: 150, width: 210, yPosition: 105, animationDuration: 7.0, animationDelay: 2.5),
        CloudConfig(height: 150, width: 170, yPosition: 300, animationDuration: 7.0, animationDelay: 0.0),
        CloudConfig(height: 240, width: 290, yPosition: 350, animationDuration: 7.0, animationDelay: 2.5),
        CloudConfig(height: 120, width: 150, yPosition: 520, animationDuration: 7.0, animationDelay: 0.5),
        CloudConfig(height: 150, width: 190, yPosition: 600, animationDuration: 7.0, animationDelay: 2.5)
    ]
    
    @State private var cloudPositions: [CGFloat] = Array(repeating: -300, count: 7)
    @State private var rectangleWidth: CGFloat = 80
    @State private var currentPhaseText: String = "Breathe in"
    @State private var showRectangle: Bool = true
    @State private var textOpacity: Double = 1.0

    @EnvironmentObject private var coordinator: AppCoordinator

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ForEach(clouds.indices, id: \.self) { index in
                    let cloud = clouds[index]
                    Cloud(height: cloud.height, width: cloud.width)
                        .position(x: cloudPositions[index], y: cloud.yPosition)
                        .onAppear {
                            withAnimation(
                                Animation.linear(duration: cloud.animationDuration)
                                    .repeatForever(autoreverses: false)
                                    .delay(cloud.animationDelay)
                            ) {
                                cloudPositions[index] = geometry.size.width + 100
                            }
                        }
                }
            }
            
            VStack {
                Spacer()
                if showRectangle {
                    Text(currentPhaseText)
                        .font(.title)
                        .fontWeight(.bold)
                        .opacity(textOpacity)
                        .animation(.easeInOut(duration: 1.0), value: textOpacity)
                    Rectangle()
                        .fill(Color.blue)
                        .cornerRadius(10)
                        .frame(width: rectangleWidth, height: 30)
                        .onAppear {
                            animateBreathingCycle()
                        }
                }
                Spacer()
            }
        }
        .navigationTitle(MeditationStrings.MeditationViews.navigationTitle)
    }
    
    private func animateBreathingCycle() {
        // Ensure the initial state is consistent
        currentPhaseText = MeditationStrings.CloudsView.breatheIn
        rectangleWidth = 80
        textOpacity = 1.0
        
        // Breathe In
        withAnimation(.easeInOut(duration: 10)) {
            rectangleWidth = 300
        }
        
        // Hold
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.changeText(to: MeditationStrings.CloudsView.hold)
        }
        
        // Breathe Out
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            self.changeText(to: MeditationStrings.CloudsView.breatheOut)
            withAnimation(.easeInOut(duration: 10)) {
                rectangleWidth = 80
            }
        }
        
        // Hide the rectangle and text, then navigate to the next view
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            showRectangle = false
            currentPhaseText = ""
            coordinator.pushNext(to: .clouds)
        }
    }
    
    private func changeText(to newText: String) {
        // Fade out the current text
        withAnimation(.easeInOut(duration: 1.0)) {
            textOpacity = 0.0
        }
        
        // Change the text and fade it in
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            currentPhaseText = newText
            withAnimation(.easeInOut(duration: 1.0)) {
                textOpacity = 1.0
            }
        }
    }
}

// Individual clouds
struct Cloud: View {
    var height: CGFloat
    var width: CGFloat
    var body: some View {
        Image(systemName: "cloud")
            .resizable()
            .frame(width: width, height: height)
            .foregroundStyle(.blue)
            .opacity(0.3)
    }
}

#Preview {
    MeditationCloudsView()
        .environmentObject(AppCoordinator())
}
