//
//  ContentView.swift
//  Shared
//
//  Created by ZoeWave on 7/18/20.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationView {
                   VStack {
                    GikeGridView()
                       NavigationLink(destination: HomeView()) {
                           Text("Home")
                       }.navigationBarTitle("Bike Home")
                   }
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
