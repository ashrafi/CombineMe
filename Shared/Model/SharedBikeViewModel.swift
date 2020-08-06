//
//  SharedBikeViewModel.swift
//  CombineMe (iOS)
//
//  Created by Swift Developer on 8/1/20.
//
// ViewModel Create the Model
import Foundation
import Combine
// Only want one and use as a referece everywhere
class SharedBikeViewModel : ObservableObject, Identifiable {
    
    @Published var stations: [Station] = []
    private var disposables = Set<AnyCancellable>()
    
    init() {
        getInfo(www_url: URL(string: "https://gbfs.fordgobike.com/gbfs/en/station_information.json")!)
    }
    
    var cancellable : AnyCancellable?
    func getInfo(www_url:URL) {
        /* cancellable = */
        URLSession.shared
            .dataTaskPublisher(for: www_url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                print("data \(element.data)")
                return element.data
            }
            .decode(type: StationInfo.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {print ("Received completion: \($0).")},
                  receiveValue: {data in
                    
                    /*guard let response = String(data: data, encoding: .utf8) else { return }
                    print(response)*/
                    print ("Received user: \(data).")
                    
                    self.stations = data.data.stations
                    
                  })
            .store(in: &disposables)
        
    }
    
    
}

/*
 Rules:
 The View has a reference to the ViewModel, but not vice-versa.
 The ViewModel has a reference to the Model, but not vice-versa.
 The View has no reference to the Model or vice-versa.
 */
/**
 Reactive using SwiftUI and Combine not RxSwift or ReactiveSwift
 to cleanly define a chain that starts in your UI, way down to a network call and vice-versa
 */

// https://quickbirdstudios.com/blog/swiftui-architecture-redux-mvvm/
// https://github.com/quickbirdstudios/SwiftUI-Architectures/blob/master/README/MVVM.jpeg
// Class : inheratance
// Func : return type
