//
//  RemoteControllerView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 4/29/21.
//

import SwiftUI
import UIKit

struct RemoteControllerView: View {
    
    @State var leftButtonPressed = false
    @State var rightButtonPressed = false
    @State var forwardButtonPressed = false
    @State var backwardButtonPressed = false
    @State var stopButtonPressed = false
    @State var numButtonPressed = 0 //if this value is ever more than 1, reset to zero and show an error notification on screen
    //@State var bcc = BluetoothControlCenter()
    
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
