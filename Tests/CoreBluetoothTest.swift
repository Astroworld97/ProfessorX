//
//  CoreBluetoothTest.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/22/21.
//  reference: https://punchthrough.com/core-bluetooth-basics/

import CoreBluetooth
import UIKit

/*
 The central manager is the first object you'll need to instantiate to set up a Bluetooth connection.
 It handles monitoring the Bluetooth state of the device, scanning for Bluetooth peripherals, and connecting to and
 disconnecting from them.
 */

class BluetoothViewController: UIViewController, CBCentralManagerDelegate{
    
    private var centralManager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    /*
     The centralManagerDidUpdateState() method is called by CoreBluetooth whenever the state of Bluetooth on the phone and
     within the app is updated. Under normal circumstances you should receive a didUpdateState() call to the delegate object
     almost immediately after initializing the central manager, with the included state being .poweredOn.
     
     As of iOS 10, the possible states include:
     
     1. poweredOn: Bluetooth is enabled, authorized, and ready for app use.
     2. poweredOff: The user has toggled Bluetooth off and will need to turn it back on from Settings or the Control Center.
     3. resetting: The connection with the Bluetooth service was interrupted.
     4. unauthorized: The user has refused the app permission to use Bluetooth. The user must re-enable it from the app's Settings menu.
     5. unsupported: The iOS device does not support Bluetooth.
     6. unknown: The state of the manager and the app's connection to the Bluetooth service is unknown.
     */
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            startScan()
        case .poweredOff:
            // Alert user to turn on Bluetooth
        case .resetting:
            // Wait for next state update and consider logging interruption of Bluetooth service
        case .unauthorized:
            // Alert user to enable Bluetooth permission in app settings
        case .unsupported:
            // Alert user their device does not support Bluetooth and app will not work as expected
        default .unknown:
            //Wait for next state update
            
        }
    }
}
