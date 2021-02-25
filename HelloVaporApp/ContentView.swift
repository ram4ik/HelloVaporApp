//
//  ContentView.swift
//  HelloVaporApp
//
//  Created by Ramill Ibragimov on 25.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            TextField("Put your name here...", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                doPostRequest()
            }, label: {
                Text("POST")
            })
        }
    }
    
    private func doPostRequest() {
        let network = Network()
        network.postRequest(name: name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
