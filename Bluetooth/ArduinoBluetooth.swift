//
//  ArduinoBluetooth.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/11/21.
/*
Important:

Your app will crash if its Info.plist doesn’t include usage description keys for the types of data it needs to access. To access Core Bluetooth APIs on apps linked on or after iOS 13, include the NSBluetoothAlwaysUsageDescription key. In iOS 12 and earlier, include NSBluetoothPeripheralUsageDescription to access Bluetooth peripheral data.
*/

//This class corresponds to the Black Widow BLE Arduino shield
//Note: ArduinoBluetooth == BTService
//Reference: https://www.raywenderlich.com/2164-arduino-tutorial-integrating-bluetooth-le-and-ios-with-swift

import CoreBluetooth

/* Services & Characteristics UUIDs */
let BlackWidowBLEUUID = CBUUID(string: "025A7775-49AA-42BD-BBDB-E2AE77782966") //UUID for the Black Widow BLE shield
let BlackWidowBLETXUUID = CBUUID(string: "F38A2C23-BC54-40FC-BED0-60EDDA139F47") //UUID for the TX of the Black Widow BLE shield. The iOS device sends data to the BLE Shield’s TX characteristic which is then received on the RX pin of the Arduino. The maximum amount of data which can be sent at once is 20 bytes due to BLE121LR restrictions.
let ArduinoBluetoothChangedStatusNotification = "kBLEServiceChangedStatusNotification" //no idea what this is for

class ArduinoBluetooth : NSObject, CBPeripheralDelegate{
    var peripheral: CBPeripheral?
    var positionCharacteristic: CBCharacteristic?
    
    init(initWithPeripheral peripheral: CBPeripheral) {
      super.init()
      
      self.peripheral = peripheral
      self.peripheral?.delegate = self
    }
    
    deinit {
      self.reset()
    }
    
    func startDiscoveringServices() {
      self.peripheral?.discoverServices([BlackWidowBLEUUID])
    }
    
    func reset() {
      if peripheral != nil {
        peripheral = nil
      }
      
      // Deallocating therefore send notification
      self.sendBTServiceNotificationWithIsBluetoothConnected(false)
    }
    
    // Mark: - CBPeripheralDelegate
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
      let uuidsForBTService: [CBUUID] = [BlackWidowBLETXUUID]
      
      if (peripheral != self.peripheral) {
        // Wrong Peripheral
        return
      }
      
      if (error != nil) {
        return
      }
      
      if ((peripheral.services == nil) || (peripheral.services!.count == 0)) {
        // No Services
        return
      }
      
      for service in peripheral.services! {
        if service.uuid == BlackWidowBLEUUID {
          peripheral.discoverCharacteristics(uuidsForBTService, for: service)
        }
      }
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
      if (peripheral != self.peripheral) {
        // Wrong Peripheral
        return
      }
      
      if (error != nil) {
        return
      }
      
      if let characteristics = service.characteristics {
        for characteristic in characteristics {
          if characteristic.uuid == BlackWidowBLETXUUID {
            self.positionCharacteristic = (characteristic)
            peripheral.setNotifyValue(true, for: characteristic)
            
            // Send notification that Bluetooth is connected and all required characteristics are discovered
            self.sendBTServiceNotificationWithIsBluetoothConnected(true)
          }
        }
      }
    }
    
    func writePosition(_ position: UInt8) {
      // See if characteristic has been discovered before writing to it
      if let positionCharacteristic = self.positionCharacteristic {
          let data = Data(_: [position])
          self.peripheral?.writeValue(data, for: positionCharacteristic, type: CBCharacteristicWriteType.withResponse)
      }
    }
    
    func sendBTServiceNotificationWithIsBluetoothConnected(_ isBluetoothConnected: Bool) {
      let connectionDetails = ["isConnected": isBluetoothConnected]
      NotificationCenter.default.post(name: Notification.Name(rawValue: ArduinoBluetoothChangedStatusNotification), object: self, userInfo: connectionDetails)
    }
    
}
