//
//  BLEManager.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 6/2/21.
//  source: https://stackoverflow.com/questions/67736804/why-i-couldnt-detect-other-bluetooth-devices-using-corebluetooh-in-swiftui

import Foundation
import CoreBluetooth

struct Peripheral: Identifiable{
    let id: Int
    let name: String
    let rssi: Int
}

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate{
    
    var myCentral: CBCentralManager!
    @Published var isSwitchedOn = false
    @Published var peripherals = [Peripheral]()
    var BlackWidowBLECBUUID = CBUUID(string: "025A7775-49AA-42BD-BBDB-E2AE77782966")
    var BlackWidowBLETXCBUUID = CBUUID(string: "F38A2C23-BC54-40FC-BED0-60EDDA139F47")
    var BlackWidowBLERXCBUUID = CBUUID(string: "A9CD2F86-8661-4EB1-B132-367A3434BC90")
    var CBUUIDarray:[CBUUID]
    var blackWidowPeripheral: CBPeripheral!

    override init(){
        self.CBUUIDarray = [CBUUID]()
        self.CBUUIDarray.append(BlackWidowBLECBUUID)
        self.CBUUIDarray.append(BlackWidowBLETXCBUUID)
        self.CBUUIDarray.append(BlackWidowBLERXCBUUID)
        super.init()
        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
        
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn{
            isSwitchedOn = true
        }else{
            isSwitchedOn = false
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String:Any], rssi RSSI: NSNumber) {
        let newPeripheral = Peripheral(id: peripherals.count, name: peripheral.name ?? "Unknown", rssi: RSSI.intValue)
        print(newPeripheral)
        peripherals.append(newPeripheral)
        print("peripheral: \(peripheral)")
        blackWidowPeripheral = peripheral
    }
    
    func startScanning(){
        print("Start scanning...")
        //myCentral.scanForPeripherals(withServices: [BlackWidowBLECBUUID])
        myCentral.scanForPeripherals(withServices: CBUUIDarray)
    }
    
    func stopScanning(){
        myCentral.stopScan()
        print("Stopped scan!")
    }
    
    func connect(){
        myCentral.connect(blackWidowPeripheral)
        print("Connected")
    }
    
    func checkArduinoConnection(){
        //centralManager.retrieveConnectedPeripherals(CBUUID array) returns
        //A list of the peripherals that are currently connected to the system and that contain any of the services specified in the parameter.
        //reference: https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/1518924-retrieveconnectedperipherals
        var retval = myCentral.retrieveConnectedPeripherals(withServices: CBUUIDarray)
        if(retval.contains(blackWidowPeripheral)){
            print("Successful Connection")
        }
    }
    
}
