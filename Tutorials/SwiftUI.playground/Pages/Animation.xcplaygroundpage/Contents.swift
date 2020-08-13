//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport


struct ContentView : View {
    @State private var isButtonVisible = true
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isButtonVisible.toggle()
            }) {
                Text("Press me")
            }
            
            if isButtonVisible {
                Button(action: {}) {
                    Text("Hidden Button")
                }.animation(.easeInOut)
            }
            
            Button(action: {
                // great for debugging
                withAnimation(.easeInOut(duration: 20)) {
                    self.showDetail.toggle()
                }
            }) {
                Image(systemName: "chevron.right.circle")
                    .imageScale(.large)
                    .rotationEffect(.degrees(showDetail ? 90 : 0))
                    .scaleEffect(showDetail ? 1.5 : 1)
                    .padding()
                    //.animation(.easeInOut)
                    .animation(.spring())
            }
        }
    }
}

struct PolygonShape: Shape {
    var sides: Int
    
    func path(in rect: CGRect) -> Path {
        // hypotenuse
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        
        // center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        
        var path = Path()
        
        for i in 0..<sides {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
            
            // Calculate vertex position
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        
        path.closeSubpath()
        
        return path
    }
}

struct ContentViewP : View {
    @State private var isSquare = true
    let duration = 20.0
    var body: some View {
        PolygonShape(sides: isSquare ? 4 : 3)
            .stroke(Color.blue, lineWidth: 3)
            .animation(.easeInOut(duration: duration))
    }
}


PlaygroundPage.current
    .setLiveView(ContentViewP())
    //.setLiveView(ContentView())


//: [Next](@next)
