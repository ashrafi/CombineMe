//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport
var str = "Hello, playground"

/*
 1) A parent view proposes a size for its child.
 2) Based on that information, the child then chooses its own size and the parent must respect that choice.
 3) The parent then positions the child in its coordinate space.
 */

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .background(Color.red)
    }
}

struct ContentView1: View {
    var body: some View {
        Text("Hello, World2!")
            .padding(20)
            .background(Color.red)
    }
}

struct ContentView2: View {
    var body: some View {
        HStack{
        Text("Hello, world!")
            .background(Color.red)
            .position(x: 100, y: 100)
             // whole place red
        }.frame(minWidth: 500,
                maxWidth: .infinity,
                minHeight: 500,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
    
}

struct ContentView3: View {
    var body: some View {
        HStack{
        Text("Hello, world!")
            .position(x: 100, y: 100)
            .background(Color.red) // whole place red
        }.frame(minWidth: 500,
                maxWidth: .infinity,
                minHeight: 500,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
    
}

struct ContentView4: View {
    var body: some View {
        HStack{
        Text("Hello, world!")
            .offset(x: 100, y: 100)
            .background(Color.red)
        }.frame(minWidth: 500,
                maxWidth: .infinity,
                minHeight: 500,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
    
}

struct ContentView5: View {
    var body: some View {
        HStack {
        Text("Hello, world!")
            .background(Color.red)
            .offset(x: 100, y: 100)
        }.frame(minWidth: 500,
                maxWidth: .infinity,
                minHeight: 500,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
    
}

PlaygroundPage.current
    //.setLiveView(ContentViewP())
    .setLiveView(ContentView4())


/**
 * SwiftUI: “Hey, ContentView, you have the whole screen to yourself – how much of it do you need?” (Parent view proposes a size)
 
 * ContentView: “I don’t care; I’m layout neutral. Let me ask my child: hey, background, you have the whole screen to yourself – how much of it do you need?” (Parent view proposes a size)
 
 * Background: “I also don’t care; I’m layout neutral too. Let me ask my child: hey, text, you can have the whole screen to yourself – how much of it do you need?” (Parent view proposes a size)
 
 * Text: “Well, I have the letters ‘Hello, World’ in the default font, so I need exactly X pixels width by Y pixels height. I don’t need the whole screen, just that.” (Child chooses its size.)
 
 * Background: “Got it. Hey, ContentView: I need X by Y pixels, please.”
 
 * ContentView: “Right on. Hey, SwiftUI: I need X by Y pixels.”
 
 * SwiftUI: “Nice. Well, that leaves lots of space, so I’m going to put you at your size in the center.” (Parent positions the child in its coordinate space.)
 
 */

//: [Next](@next)
