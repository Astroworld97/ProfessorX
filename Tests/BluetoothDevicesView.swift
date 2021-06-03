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
    VStack (spacing: 10) {
        Text("Bluetooth Devices")
            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .center)
        
        List(bleManager.peripherals) { peripheral in
            HStack {
                Text(peripheral.name)
                Spacer()
                //Text(String(peripheral.rssi))
            }
        }
        .frame(height: UIScreen.main.bounds.height/2)
        
        Spacer()
        
        Text("STATUS")
            .font(.headline)
        
        // Status goes here
        if bleManager.isSwitchedOn {
            Text("Bluetooth is switched on")
                .foregroundColor(.green)
        }
        else {
            Text("Bluetooth is NOT switched on")
                .foregroundColor(.red)
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
        }.padding()
        Spacer()
    }
}
}

//struct BluetoothDevicesView_Previews: PreviewProvider {
//    static var previews: some View {
//        BluetoothDevicesView()
//    }
//}
