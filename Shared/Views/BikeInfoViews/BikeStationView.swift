//
//  BikeView.swift
//  CombineMe
//
//  Created by Swift Developer on 8/7/20.
//
import MapKit
import SwiftUI

struct BikeStationView: View {
    @ObservedObject var viewModel = SharedBikeViewModel()
    
    var body: some View {
        List(viewModel.stations) { station in
            NavigationLink(destination: BikeMapView(station: station)) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(station.name)
                            .font(.headline)
                        Text("Capacity \(station.capacity)")
                            .font(.subheadline)
                    }
                }
            }.navigationBarTitle("Bike Stations")
        }
    }
}

struct BikeView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationView()
    }
}
