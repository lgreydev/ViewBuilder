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
                AlertView {
                    Image(systemName: "exclamationmark.shield.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Custom Alert!")
                }
            }
            .navigationTitle("View Builder")
        }
    }
}




// MARK: Custom View
struct AlertView<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            content
                .padding()

            Divider().overlay(.white)

            HStack {
                Button {
                    let _ = print("Cancel")
                } label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                        .bold()
                }

                Spacer()

                Button {
                    let _ = print("Confirm")
                } label: {
                    Text("Confirm")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.size.width/2)
        .background(.blue)
        .cornerRadius(7)
        .padding()
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
