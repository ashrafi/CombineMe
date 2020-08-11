// SwiftUI 2 Playgound
import SwiftUI
import PlaygroundSupport

struct ContentViewHW: View {
    var body: some View {
        Text("Hello World")
    }
}

struct ContentViewBut: View {
    var body: some View {
        Text("Hello World")
    }
}



PlaygroundPage.current
    //.setLiveView(ContentViewHW())
    .setLiveView(ContentViewBut())
