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
                Spacer()
                Text("Speed Menu")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(alignment: .center)
                    .accentColor(.white)
                Spacer()
                Picker("Speed", selection: $selectedSpeed) {
                    Label("High speed", systemImage: "bolt.fill").tag(SpeedEnum.high)
                    Label("Mid speed", systemImage: "hare.fill").tag(SpeedEnum.mid)
                    Label("Low speed", systemImage: "tortoise.fill").tag(SpeedEnum.low)
                    Label("Stopped", systemImage: "hand.raised.fill").tag(SpeedEnum.stopped)
                    Label("Custom Speed", systemImage: "pencil").tag(SpeedEnum.custom)
                }.accentColor(.white)
                Text("Selected speed: \(selectedSpeed.rawValue)")
                    .accentColor(.white)
                Spacer()
                Spacer()
            }
        }
    }
}
