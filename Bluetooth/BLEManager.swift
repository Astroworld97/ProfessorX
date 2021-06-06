//
//  BLEManager.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 6/2/21.
//  source: https://stackoverflow.com/questions/67736804/why-i-couldnt-detect-other-bluetooth-devices-using-corebluetooh-in-swiftui

import Foundation
import CoreBluetooth


class Peripheral: Identifiable{
    var id: Int
    var name: String
    var rssi: Int
    var approxDistInMeters: Float //for more info on the conversion between RSSI and distance in meters, read the Notes.docx Word file and the Meters vs RSSI Excel sheet

    init(id: Int, name: String, rssi: Int, approxDistInMeters: Float, approxDistInFeet: Float){
        self.id = id
        self.name = name
        self.rssi = rssi
        self.approxDistInMeters = approxDistInMeters
    }

    //Note: I split up the calculation into several steps because the program wouldn't compile otherwise
    public func convertRSSIToMeters(RSSI: Int) -> Float{
        approxDistInMeters = (0.0116*(pow(Float(RSSI), 6)))
        approxDistInMeters -= 0.3109*(pow(Float(RSSI), 5))
        approxDistInMeters += 3.3027*(pow(Float(RSSI), 4))
        approxDistInMeters -= 17.684*(pow(Float(RSSI), 3))
        approxDistInMeters += 49.959*(pow(Float(RSSI), 2))
        approxDistInMeters -= 71.921*Float(RSSI)
        approxDistInMeters -= 23.307
        return approxDistInMeters
    }
    public func distInMeters() -> Void{
        self.approxDistInMeters = convertRSSIToMeters(RSSI: rssi)
    }
    public func distInFeet() -> Float{
        return approxDistInMeters * 3.28
    }
}

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate{
    
    var myCentral: CBCentralManager!
    @Published var isSwitchedOn = false //false if Bluetooth on phone is off. True, otherwise.
    @Published var isFound = false //false if Black Widow BLE is found when scanned. True, otherwise.
    @Published var isConnected = false //false if Black Widow BLE is is connected via Bluetooth to the phone. True, otherwise.
    @Published var peripherals = [Peripheral]()
    //service
    var BlackWidowBLECBUUID = CBUUID(string: "025A7775-49AA-42BD-BBDB-E2AE77782966")
    //characteristic
    var BlackWidowBLETXCBUUID = CBUUID(string: "F38A2C23-BC54-40FC-BED0-60EDDA139F47")
    //characteristic
    var BlackWidowBLERXCBUUID = CBUUID(string: "A9CD2F86-8661-4EB1-B132-367A3434BC90")
    var servicesArray:[CBUUID]
    var characteristicArray:[CBUUID]
    var blackWidowPeripheral: CBPeripheral!
    //var time = DispatchTime(uptimeNanoseconds: 0)

    override init(){
        self.servicesArray = [CBUUID]()
        self.characteristicArray = [CBUUID]()
        self.servicesArray.append(BlackWidowBLECBUUID)
        self.characteristicArray.append(BlackWidowBLETXCBUUID)
        self.characteristicArray.append(BlackWidowBLERXCBUUID)
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
        let newPeripheral = Peripheral(id: 0, name: "", rssi: 0, approxDistInMeters: 0.0, approxDistInFeet: 0.0)
        print(newPeripheral)
        peripherals.append(newPeripheral)
        print("peripheral: \(peripheral)")
        blackWidowPeripheral = peripheral
    }
    
    func startScanning(){
        print("Start scanning...")
        //let start = DispatchTime.now()
        myCentral.scanForPeripherals(withServices: servicesArray)
        //let tenSecs = pow(10, 10)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.myCentral.stopScan()
            print("Stopped scan!")
        }
        
    }
    
    func stopScanning(){
        myCentral.stopScan()
        print("Stopped scan!")
    }
    
    func connect(){
        if (blackWidowPeripheral == nil){
            print("Black Widow BLE is nil")
        }else{
        myCentral.connect(blackWidowPeripheral)
        isConnected = true
        print("Connected")
        }
    }
    
    func disconnect(){
        if (blackWidowPeripheral == nil){
            print("Black Widow BLE is nil")
        }else{
        myCentral.cancelPeripheralConnection(blackWidowPeripheral)
        isConnected = false
        print("Disconnected")
        }
    }
    
    func checkArduinoConnection(){
        //centralManager.retrieveConnectedPeripherals(CBUUID array) returns
        //A list of the peripherals that are currently connected to the system and that contain any of the services specified in the parameter.
        //reference: https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/1518924-retrieveconnectedperipherals
        if (blackWidowPeripheral == nil){
            print("Black Widow BLE is nil")
        }else{
            let retval = myCentral.retrieveConnectedPeripherals(withServices: servicesArray)
            if(retval.contains(blackWidowPeripheral)){
            print("Successful Connection")
            isFound = true
            }else{
            print("Not Connected")
            }
        }
    }
    
    func printServices(){
//        blackWidowPeripheral.discoverServices([BlackWidowBLECBUUID])
//        let arr = blackWidowPeripheral
//        print(arr)
        for s in servicesArray{
            print(s)
        }
    }
    
//    func writeSpeed(speed: Int){
//        blackWidowPeripheral.writeValue(speed, for: CBCharacteristic)
//    }
    
}
