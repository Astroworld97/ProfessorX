//
//  MainView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 4/29/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            RemoteControllerView()
                   .tabItem {
                       Image(systemName: "gamecontroller.fill")
                       Text("Move")
                   }
            SpeedMenuPicker()
                    .tabItem{
                        Image(systemName: "speedometer")
                        Text("Speed")
                    }
            BluetoothDevicesView()
                .tabItem{
                    Image(systemName: "flipphone")
                    Text("Bluetooth")
                }
        }
    }
}




//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
