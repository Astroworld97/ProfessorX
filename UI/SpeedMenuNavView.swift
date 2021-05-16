//
//  SpeedMenuNavView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/14/21.
//

import SwiftUI

struct SpeedMenuNavView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: SpeedMenuPicker()){
                Label("Set speed", systemImage: "speedometer")
            }
        }
    }
}
