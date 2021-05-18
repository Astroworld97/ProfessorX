////
////  BluetoothControlCenter.swift
////  ProfessorX
////
////  Created by Ian Gonzalez on 5/17/21.
////
//
//import SwiftUI
//
//class BluetoothControlCenter{
//    
//    var numericalSpeed: UInt8 = 255
//    var textualSpeed: String = ""
//    var allowTX = true
//    
//    func sendSpeed(speed: UInt8) {
//        // Valid position range: 0 to 180
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
//          // Send position to BLE Shield (if service exists and is connected)
//          if let bleService = btDiscoverySharedInstance.bleService {
//            bleService.writePosition(position)
//            lastPosition = position
//
//            // 5
//            // Start delay timer
//            allowTX = false
//            if timerTXDelay == nil {
//              timerTXDelay = Timer.scheduledTimer(timeInterval: 0.1,
//                target: self,
//                selector: #selector(ViewController.timerTXDelayElapsed),
//                userInfo: nil,
//                repeats: false)
//            }
//          }
//        }
//    
//    
//    
//    
//}
//
