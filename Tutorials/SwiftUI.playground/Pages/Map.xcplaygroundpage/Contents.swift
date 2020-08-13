//: [Previous](@previous)

import Foundation
import SwiftUI
import MapKit
import PlaygroundSupport


struct ContentMapView: View {
    @State var region = MKCoordinateRegion(center: .init(latitude: 37.334722, longitude: -122.008889), latitudinalMeters: 300, longitudinalMeters: 300)
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

PlaygroundPage.current
    .setLiveView(ContentMapView())

//: [Next](@next)
