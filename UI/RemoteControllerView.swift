//
//  RemoteControllerView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 4/29/21.
//  References: https://www.raywenderlich.com/2164-arduino-tutorial-integrating-bluetooth-le-and-ios-with-swift and https://www.raywenderlich.com/231-core-bluetooth-tutorial-for-ios-heart-rate-monitor

import SwiftUI

struct RemoteControllerView: View {
    
    @State var leftButtonPressed = false
    @State var rightButtonPressed = false
    @State var forwardButtonPressed = false
    @State var backwardButtonPressed = false
    @State var stopButtonPressed = false
    @State var numButtonPressed = 0 //if this value is ever more than 1, reset to zero and show an error notification on screen

    var body: some View {
        ZStack{
//            Image("nyc")
//                .clipShape(Rectangle())
//                .frame(width: 300, height: 300)
//                .ignoresSafeArea()
            VStack(alignment: .center){
                ForwardButton()
                    //.alignmentGuide(HorizontalAlignment.center, computeValue: {_ in 80})
                Spacer()
            .frame(height: 50)
                HStack{
                    LeftButton()
                    Spacer()
                    StopButton()
                    Spacer()
                    RightButton()
                }
                Spacer()
                    .frame(height: 50)
                BackwardButton()
                    //.alignmentGuide(HorizontalAlignment.center, computeValue: {_ in 80})
                    //.alignmentGuide(.custom) { $0[HorizontalAlignment.center] }
            }
        }
    }
}

//struct RemoteControllerView_Previews: PreviewProvider {
//    static var previews: some View {
//        RemoteControllerView()
//    }
//}
