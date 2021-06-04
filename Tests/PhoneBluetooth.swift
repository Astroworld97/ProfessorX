////
////  PhoneBluetooth.swift
////  ProfessorX
////
////  Created by Ian Gonzalez on 5/11/21.
///*
// Important:
//
// Your app will crash if its Info.plist doesn’t include usage description keys for the types of data it needs to access. To access Core Bluetooth APIs on apps linked on or after iOS 13, include the NSBluetoothAlwaysUsageDescription key. In iOS 12 and earlier, include NSBluetoothPeripheralUsageDescription to access Bluetooth peripheral data.
// */
//
////Note: PhoneBluetooth == BTDiscovery
////reference: https://www.raywenderlich.com/2164-arduino-tutorial-integrating-bluetooth-le-and-ios-with-swift
//
//import CoreBluetooth
//
//let phoneBluetoothSharedInstance = PhoneBluetooth();
//
//class PhoneBluetooth : NSObject, CBCentralManagerDelegate{
//
//    private var centralManager: CBCentralManager?
//    private var peripheralBLE: CBPeripheral?
//
//    override init() {
//      super.init()
//
//      let centralQueue = DispatchQueue(label: "com.iagonzal", attributes: [])
//      centralManager = CBCentralManager(delegate: self, queue: centralQueue)
//    }
//
//    func startScanning() {
//      if let central = centralManager {
//        central.scanForPeripherals(withServices: [BlackWidowBLEUUID], options: nil)
//      }
//    }
//
//    var arduinoBluetooth: ArduinoBluetooth? {
//      didSet {
//        if let service = self.arduinoBluetooth {
//          service.startDiscoveringServices()
//        }
//      }
//    }
//
//
//
//// MARK: - CBCentralManagerDelegate
//
//func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
//  // Be sure to retain the peripheral or it will fail during connection.
//
//  // Validate peripheral information
//  if ((peripheral.name == nil) || (peripheral.name == "")) {
//    return
//  }
//
//  // If not already connected to a peripheral, then connect to this one
//  if ((self.peripheralBLE == nil) || (self.peripheralBLE?.state == CBPeripheralState.disconnected)) {
//    // Retain the peripheral before trying to connect
//    self.peripheralBLE = peripheral
//
//    // Reset service
//    self.arduinoBluetooth = nil
//
//    // Connect to peripheral
//    central.connect(peripheral, options: nil)
//  }
//}
//
//    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
//
//      // Create new service class
//      if (peripheral == self.peripheralBLE) {
//        self.arduinoBluetooth = ArduinoBluetooth(initWithPeripheral: peripheral)
//      }
//
//      // Stop scanning for new devices
//      central.stopScan()
//    }
//    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
//
//      // See if it was our peripheral that disconnected
//      if (peripheral == self.peripheralBLE) {
//        self.arduinoBluetooth = nil;
//        self.peripheralBLE = nil;
//      }
//
//      // Start scanning for new devices
//      self.startScanning()
//    }
//
//    // MARK: - Private
//
//    func clearDevices() {
//      self.arduinoBluetooth = nil
//      self.peripheralBLE = nil
//    }
//
//    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//      switch (central.state) {
//      case .poweredOff:
//        self.clearDevices()
//
//      case .unauthorized:
//        // Indicate to user that the iOS device does not support BLE.
//        break
//
//      case .unknown:
//        // Wait for another event
//        break
//
//      case .poweredOn:
//        self.startScanning()
//
//      case .resetting:
//        self.clearDevices()
//
//      case .unsupported:
//        break
//      }
//    }
//
//
//
//
//
//
//}
