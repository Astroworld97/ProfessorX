//
//  RemoteControllerView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 4/29/21.
//

import SwiftUI
import UIKit

struct RemoteControllerView: View {
    
    @State var buttonPressed = true
    
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
