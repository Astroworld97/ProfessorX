//
//  StopButton.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/17/21.
//

import SwiftUI

struct StopButton: View {
    var body: some View {
        Button(action: {
            print("Stop button pressed")
        }) {
            VStack {
                Image(systemName: "hand.raised")
                    .foregroundColor(.white)
                    .background(Color.black)
                Text("Stop button")
                    .foregroundColor(.white)
                    .background(Color.black)
            }

        }
    }
}

struct StopButton_Previews: PreviewProvider {
    static var previews: some View {
        StopButton()
    }
}
