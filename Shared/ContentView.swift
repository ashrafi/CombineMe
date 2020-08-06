//
//  ContentView.swift
//  Shared
//
//  Created by ZoeWave on 7/18/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = SharedBikeViewModel()
    //var viewModel = SharedBikeViewModel().stations
    
    
    var body: some View {
        List(viewModel.stations) { station in // 2
            HStack {
                VStack(alignment: .leading) {
                    Text(station.name) // 3a
                        .font(.headline)
                    Text("Capacity \(station.capacity)") // 3b
                        .font(.subheadline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
