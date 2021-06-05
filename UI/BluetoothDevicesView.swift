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
        
    VStack (spacing: 25) {
        Spacer()
        Text("Bluetooth Manager")
            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(alignment: .center)
        Spacer()
        Text("STATUS")
            .font(.title)
        //Spacer()
        //Spacer()
        // Status goes here
        //this indicates if Bluetooth is on or not FOR THE DEVICE, i.e. the iPhone
        if bleManager.isSwitchedOn {
            Text("Bluetooth is switched on")
                .foregroundColor(.green)
                .font(.title2)
        }else{
            Text("Bluetooth is NOT switched on")
                .foregroundColor(.red)
                .font(.title3)
        }
        if bleManager.isConnected{
            Text("Arduino is connected")
                .foregroundColor(.green)
                .font(.title2)
        }else{
            Text("Arduino is NOT connected")
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
                bleManager.disconnect()
            }) {
                Text("Disconnect from Arduino")
            }
            Button(action: {
                bleManager.checkArduinoConnection()
            }) {
                Text("Check Arduino Connection")
            }
            Button(action: {
                bleManager.printServices()
            }) {
                Text("Test")
            }
            Spacer()
            List(bleManager.peripherals) { peripheral in
                HStack {
                    Spacer()
                    Text(peripheral.name)
                    Spacer()
                    Text(String(peripheral.rssi))
                    Spacer()
                }
            }

        }.padding()
    }
}
}
}

//struct BluetoothDevicesView_Previews: PreviewProvider {
//    static var previews: some View {
//        BluetoothDevicesView()
//    }
//}
