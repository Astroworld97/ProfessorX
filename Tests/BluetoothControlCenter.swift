////
////  BluetoothControlCenter.swift
////  ProfessorX
////
////  Created by Ian Gonzalez on 5/17/21.
////
//
//import Foundation
//import SwiftUI
//
//class BluetoothControlCenter{
//    
//    init(){
//        
//    }
//    
//    var numericalSpeed: UInt8 = 255
//    var textualSpeed: String = ""
//    var allowTX = true
//    var pb = PhoneBluetooth()
//    
//    var imgBluetoothConnected: some View{
//        Image("Bluetooth_Connected")
//    }
//    var imgBluetoothDisconnected: some View{
//        Image("Bluetooth_Connected")
//    }
//    var isConnected: Bool
//    
//    //valid speed range: 0 to 255
//    func sendSpeed(speed: UInt8) {
//        
//          // 1
//          if !allowTX {
//            return
//          }
//          
//          // 2
//          // Validate value
//          if (speed == numericalSpeed) {
//            return
//          }
//          // 3
//          else if ((speed < 0) || (speed > 255)) {
//            return
//          }
//          
//          // 4
//          // Send position to BlackWidow BLE Shield (if service exists and is connected)
//        if let arduinoBluetooth = phoneBluetoothSharedInstance.arduinoBluetooth {
//            arduinoBluetooth.writeSpeed(speed)
//            numericalSpeed = speed
//
//          }
//    }
//    
//    func connectionChanged() {
//      // Set image based on connection status
//        if isConnected {
//            self.imgBluetoothConnected
//        } else {
//            self.imgBluetoothDisconnected
//        }
//      }
//  }
