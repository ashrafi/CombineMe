//: [Previous](@previous)

import Foundation
import SwiftUI
import MapKit
import PlaygroundSupport


struct ContentMapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

PlaygroundPage.current
    .setLiveView(ContentMapView())

//: [Next](@next)
