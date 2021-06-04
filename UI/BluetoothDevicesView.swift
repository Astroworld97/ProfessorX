//
//  BluetoothDevicesView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 6/2/21.
//  source: https://stackoverflow.com/questions/67736804/why-i-couldnt-detect-other-bluetooth-devices-using-corebluetooh-in-swiftui

import SwiftUI

struct BluetoothDevicesView: View {
@ObservedObject var bleManager = BLEManager()

var body: some View {
    ZStack{
        Image("bluetooth_in_hand")
            .colorInvert()
            .opacity(0.2)
    VStack (spacing: 70) {
        Spacer()
        Text("Bluetooth Devices")
            .font(.largeTitle)
            //.frame(maxWidth: .infinity, alignment: .center)
            .frame(alignment: .center)

        
        List(bleManager.peripherals) { peripheral in
            HStack {
                Text(peripheral.name)
                Spacer()
                //Text(String(peripheral.rssi))
            }
        }
        
        Text("STATUS")
            .font(.title)
        
        // Status goes here
        //this indicates if Bluetooth is on or not FOR THE DEVICE, i.e. the iPhone
        if bleManager.isSwitchedOn {
            Text("Bluetooth is switched on")
                .foregroundColor(.green)
                .font(.title2)
        }
        else {
            Text("Bluetooth is NOT switched on")
                .foregroundColor(.red)
                .font(.title3)
        }
        
        Spacer()
        VStack (spacing: 25) {
            Button(action: {
                bleManager.startScanning()
            }) {
                Text("Start Scanning")
            }
            Button(action: {
                bleManager.stopScanning()
            }) {
                Text("Stop Scanning")
            }
            Button(action: {
                bleManager.connect()
            }) {
                Text("Connect to Arduino")
            }
            Button(action: {
                bleManager.checkArduinoConnection()
            }) {
                Text("Check Arduino Connection")
            }

        }.padding()
        Spacer()
    }
}
}
}

//struct BluetoothDevicesView_Previews: PreviewProvider {
//    static var previews: some View {
//        BluetoothDevicesView()
//    }
//}
