//
//  BluetoothControlCenter.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/17/21.
//

import SwiftUI

class BluetoothControlCenter{
    
    var numericalSpeed: UInt8 = 255
    var textualSpeed: String = ""
    var allowTX = true
    var pb = PhoneBluetooth()
    var imgBluetoothConnected: some View{
        Image("Bluetooth_Connected")
    }
    var imgBluetoothDisconnected: some View{
        Image("Bluetooth_Connected")
    }
    
    //valid speed range: 0 to 255
    func sendSpeed(speed: UInt8) {
        
          // 1
          if !allowTX {
            return
          }
          
          // 2
          // Validate value
          if (speed == numericalSpeed) {
            return
          }
          // 3
          else if ((speed < 0) || (speed > 255)) {
            return
          }
          
          // 4
          // Send position to BlackWidow BLE Shield (if service exists and is connected)
        if let arduinoBluetooth = phoneBluetoothSharedInstance.arduinoBluetooth {
            arduinoBluetooth.writeSpeed(speed)
            numericalSpeed = speed

          }
    }
    
    @objc func connectionChanged(_ notification: Notification) {
    // Connection status changed. Indicate on UI.
    let userInfo = (notification as NSNotification).userInfo as! [String: Bool]
    DispatchQueue.main.async(execute: {
      // Set image based on connection status
      if let isConnected: Bool = userInfo["isConnected"] {
        if isConnected {
            self.imgBluetoothConnected
        } else {
            self.imgBluetoothDisconnected
        }
      }
    });
  }
    
    
    
    
}

