//
//  LeftButton.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/17/21.
//

import SwiftUI

struct LeftButton: View {
    var body: some View {
        Button(action: {
            print("Left button pressed")
        }) {
            VStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .background(Color.black)
                Text("Turn left")
                    .foregroundColor(.white)
                    .background(Color.black)
            }
        }
    }
}

struct LeftButton_Previews: PreviewProvider {
    static var previews: some View {
        LeftButton()
    }
}
