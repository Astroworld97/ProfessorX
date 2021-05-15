//
//  NavViewTest.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/13/21.
//

import SwiftUI

struct NavViewTest: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("Second View")){
                Text("Hello, World!")
            }
                .navigationBarTitle("Navigation")
        }
    }
}
