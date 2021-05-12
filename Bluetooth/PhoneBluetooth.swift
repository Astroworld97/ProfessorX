//
//  PhoneBluetooth.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/11/21.
/*
 Important:

 Your app will crash if its Info.plist doesn’t include usage description keys for the types of data it needs to access. To access Core Bluetooth APIs on apps linked on or after iOS 13, include the NSBluetoothAlwaysUsageDescription key. In iOS 12 and earlier, include NSBluetoothPeripheralUsageDescription to access Bluetooth peripheral data.
 */

//Note: PhoneBluetooth == BTDiscovery
//reference: https://www.raywenderlich.com/2164-arduino-tutorial-integrating-bluetooth-le-and-ios-with-swift

import CoreBluetooth

let phoneBluetoothSharedInstance = PhoneBluetooth();

class PhoneBluetooth : NSObject, CBCentralManagerDelegate{
    
    private var centralManager: CBCentralManager?
    private var peripheralBLE: CBPeripheral?
    
    override init() {
      super.init()
      
      let centralQueue = DispatchQueue(label: "com.iagonzal", attributes: [])
      centralManager = CBCentralManager(delegate: self, queue: centralQueue)
    }
    
    func startScanning() {
      if let central = centralManager {
        central.scanForPeripherals(withServices: [BlackWidowBLEUUID], options: nil)
      }
    }
    
    var bleService: ArduinoBluetooth? {
      didSet {
        if let service = self.bleService {
          service.startDiscoveringServices()
        }
      }
    }
    
}
