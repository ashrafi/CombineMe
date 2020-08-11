//
//  GikeGridView.swift
//  CombineMe (iOS)
//
//  Created by Swift Developer on 8/9/20.
//

import SwiftUI

struct GikeGridView: View {
    // use SF Symbols
    let data = (1...1000).map { "Item \($0)" }

       let columns = [
           GridItem(.adaptive(minimum: 80))
       ]

       var body: some View {
           ScrollView {
               LazyVGrid(columns: columns, spacing: 20) {
                   ForEach(data, id: \.self) { item in
                    VStack {
                        Capsule()
                            .fill(Color.blue)
                            .frame(height:20)
                       Text(item)
                    }
                   }
               }
               .padding(.horizontal)
           }
       }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GikeGridView()
    }
}
