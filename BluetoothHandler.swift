//
//  BluetoothHandler.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/8/21.
//

/*
 Important:

 Your app will crash if its Info.plist doesn’t include usage description keys for the types of data it needs to access. To access Core Bluetooth APIs on apps linked on or after iOS 13, include the NSBluetoothAlwaysUsageDescription key. In iOS 12 and earlier, include NSBluetoothPeripheralUsageDescription to access Bluetooth peripheral data.
 */

import CoreBluetooth

class BluetoothHandler: CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        <#code#>
    }
    
    // Properties, aka instance variables
        private var centralManager: CBCentralManager!
        private var peripheral: CBPeripheral!
    
    //Constructor
    init(){
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
}
