//
//  Speed_Menu.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/12/21.
//

import SwiftUI

struct Speed_Menu: View{
    
    @State private var sort: Int = 0
    
    var body: some View {
        Menu {
            
            Button(action: {}) {
                Label("High speed", systemImage: "bolt.fill")
                }
            Button(action: {}) {
                Label("Mid speed", systemImage: "hare.fill")
                }
            Button(action: {}) {
                Label("Low speed", systemImage: "tortoise.fill")
                }
            Button(action: {}) {
                Label("Stopped", systemImage: "hand.raised.fill")
                }
        }
        label: {
            Label("Set speed", systemImage: "speedometer")
        }
    }
}


//struct SpeedMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        Speed_Menu()
//    }
//}
