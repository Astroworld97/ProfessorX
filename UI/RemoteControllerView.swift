//
//  RemoteControllerView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 4/29/21.
//

import SwiftUI
import UIKit

struct RemoteControllerView: View {
    var body: some View {
        ZStack{
            Image("nyc")
                .clipShape(Rectangle())
                .frame(width: 300, height: 300)
        VStack{
        SpeedMenuNavView()
        Button(action: {
            print("Forward button pressed")
        }) {
            VStack {
                Image(systemName: "arrow.up")
                    .foregroundColor(.white)
                    .background(Color.black)
                Text("Move forward")
                    .foregroundColor(.white)
                    .background(Color.black)
            }
        }
        //Spacer()
            HStack{
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
                Spacer()
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
        Button(action: {
            print("Backward button pressed")
        }) {
            VStack {
                Image(systemName: "arrow.down")
                    .foregroundColor(.white)
                    .background(Color.black)
                Text("Move backward")
                    .foregroundColor(.white)
                    .background(Color.black)
            }
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
