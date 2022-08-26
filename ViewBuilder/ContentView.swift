//
//  ContentView.swift
//  ViewBuilder
//
//  Created by Sergey Lukaschuk on 25.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Custom View
            }
            .navigationTitle("View Builder")
        }
    }
}

struct AlertView<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            content
                .padding()
            HStack {
                Button {
                    let _ = print("Cancel")
                } label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                        .bold()
                }

                Button {
                    let _ = print("Confirm")
                } label: {
                    Text("Confirm")
                        .bold()
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
