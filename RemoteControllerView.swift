//
//  RemoteControllerView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 4/29/21.
//

import SwiftUI

struct RemoteControllerView: View {
    var body: some View {
        VStack{
        Button(action: {
            print("Forward button pressed")
        }) {
            VStack {
                Image(systemName: "arrow.up")
                Text("Move forward")
            }
        }
        //Spacer()
            HStack{
                Button(action: {
                    print("Left button pressed")
                }) {
                    VStack {
                        Image(systemName: "arrow.left")
                        Text("Turn left")
                    }
                }
                Spacer()
                Button(action: {
                    print("Right button pressed")
                }) {
                    VStack {
                        Image(systemName: "arrow.right")
                        Text("Turn right")
                    }
                }
            }
        Button(action: {
            print("Backward button pressed")
        }) {
            VStack {
                Image(systemName: "arrow.down")
                Text("Move backward")
            }
        }
        }
    }
}
//struct RemoteControllerView_Previews: PreviewProvider {
//    static var previews: some View {
//        RemoteControllerView()
//    }
//}
