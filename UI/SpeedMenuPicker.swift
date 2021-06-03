//
//  SpeedMenuPicker.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/14/21.
//

import SwiftUI

struct SpeedMenuPicker: View {
    
    @State var selectedSpeed = SpeedEnum.stopped
    
    var body: some View {
        ZStack{
            Color.black
            VStack{
                Picker("Speed", selection: $selectedSpeed) {
                    Label("Stopped", systemImage: "hand.raised.fill").tag(SpeedEnum.stopped)
                    Label("Low speed", systemImage: "tortoise.fill").tag(SpeedEnum.low)
                    Label("Mid speed", systemImage: "hare.fill").tag(SpeedEnum.mid)
                    Label("High speed", systemImage: "bolt.fill").tag(SpeedEnum.high)
                }
                Text("Selected speed: \(selectedSpeed.rawValue)")
            }
        }
    }
}


//extension Label : Hashable{
//    public func hash(into hasher: inout Hasher) {
//        
//    }
//    
//    public static func == (lhs: Label, rhs: Label) -> Bool {
//        return true
//    }
//    
//    
//}


//struct SpeedMenuPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        SpeedMenuPicker()
//    }
//}
