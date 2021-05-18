//
//  ForwardButton.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/17/21.
//

import SwiftUI

struct ForwardButton: View {
    var body: some View {
        Button(action: {
            print("Forward button pressed")
        }) {
            VStack {
                Image(systemName: "arrow.up")
                    .foregroundColor(.white)
                    .background(Color.black)
                Text("Move forward")
                    .foregroundColor(.white)
                    .background(Color.black)
            }
        }
    }
}

struct ForwardButton_Previews: PreviewProvider {
    static var previews: some View {
        ForwardButton()
    }
}
