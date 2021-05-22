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

class BluetoothViewController: UIViewController{
    private var centralManager: CBCentralManager!
    
    override func viewDidLoad() {
        
    }
}
