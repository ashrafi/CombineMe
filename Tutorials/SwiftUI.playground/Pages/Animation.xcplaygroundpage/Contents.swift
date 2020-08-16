//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport
import KingfisherSwiftUI


struct ContentView : View {
    @State private var isButtonVisible = true
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.isButtonVisible.toggle()
                }) {
                    Text("Press me")
                }// not on button .animation(.easeInOut)
                // always try to use system images
                Image(systemName: "star.fill")
                    .foregroundColor(Color.purple)
            }
            
            Divider()
            VStack {
            Text("Hello, world!")
                .offset(y: isButtonVisible ? 0 : 300)
                .animation(.easeInOut)
                //.animation(.spring())
            }
            Divider()
            
            if isButtonVisible {
                HStack{
                    Image(uiImage: UIImage(named: "bike.jpg")!).resizable()
                        .frame(width: 32.0, height: 32.0)
                }
            }
            
            Button(action: {
                self.showDetail.toggle()
            }) {
                Image(systemName: "chevron.right.circle")
                    .imageScale(.large)
                    .rotationEffect(.degrees(showDetail ? 90 : 0))
                    .scaleEffect(showDetail ? 10.5 : 1)
                    .padding()
                    .animation(.easeInOut)
                    //.animation(.spring())
            }
        }.frame(minWidth: 500,
         maxWidth: .infinity,
         minHeight: 500,
         maxHeight: .infinity,
         alignment: .topLeading)
    }
}


PlaygroundPage.current
    .setLiveView(ContentView())


//: [Next](@next)
