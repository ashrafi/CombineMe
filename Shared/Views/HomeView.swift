//
//  SwiftUIView.swift
//  CombineMe (iOS)
//
//  Created by Swift Developer on 8/7/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Text("Lets Get Some Bikes !!!")
            BikeMenu()
            FormView()
        }
    }
}

func skip() {
    print("Menu Pressed")
}

struct BikeMenu: View {
    var body: some View {
        Menu("Actions") {
            Button("Duplicate", action: {skip()})
            Button("Rename", action: {skip()})
            Button("Delete…", action: {skip()})
            Menu("Bike Info") {
                Button("Copy", action: {skip()})
                Button("Copy Formatted", action: {skip()})
                Button("Copy Library Path", action: {skip()})
                NavigationLink(destination: BikeStationView()) {
                    Text("Bike System Info")
                }.navigationBarTitle("Bike Menu")
                NavigationLink(destination: BikeStationView()) {
                    Text("Bike Stations")
                }.navigationBarTitle("Bike Stations")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
