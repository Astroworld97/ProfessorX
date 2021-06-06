//
//  InvertColors.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 6/6/21.
//

import SwiftUI

struct InvertColors: View {
    var body: some View {
        Image("bluetooth_in_hand_black")
            .colorInvert()
            .opacity(0.2)
    }
}

//struct InvertColors_Previews: PreviewProvider {
//    static var previews: some View {
//        InvertColors()
//    }
//}
