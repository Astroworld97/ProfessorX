//
//  RightButton.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/17/21.
//

import SwiftUI

struct RightButton: View {
    var body: some View {
        Button(action: {
            print("Right button pressed")
        }) {
            VStack {
                Image(systemName: "arrow.right")
                    .foregroundColor(.white)
                    .background(Color.black)
                Text("Turn right")
                    .foregroundColor(.white)
                    .background(Color.black)
            }
        }
    }
}

struct RightButton_Previews: PreviewProvider {
    static var previews: some View {
        RightButton()
    }
}
