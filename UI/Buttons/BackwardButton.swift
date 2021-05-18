//
//  BackwardButton.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/17/21.
//

import SwiftUI

struct BackwardButton: View {
    var body: some View {
        Button(action: {
            print("Backward button pressed")
        }) {
            VStack {
                Image(systemName: "arrow.down")
                    .foregroundColor(.white)
                    .background(Color.black)
                Text("Move backward")
                    .foregroundColor(.white)
                    .background(Color.black)
            }
        }
    }
}

struct BackwardButton_Previews: PreviewProvider {
    static var previews: some View {
        BackwardButton()
    }
}
