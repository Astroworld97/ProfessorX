//
//  ToolbarTest.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/13/21.
//

import SwiftUI


struct ToolbarTest: View {
    let messages: [String]

    var body: some View {
        List(messages, id: \.self) { message in
            Text(message)
        }
        .navigationTitle("Messages")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("New") {}
            }

            ToolbarItem(placement: .principal) {
                Button("Filter") {}
            }
        }
    }
}
