//
//  BLEManager.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 6/2/21.
//  source: https://stackoverflow.com/questions/67736804/why-i-couldnt-detect-other-bluetooth-devices-using-corebluetooh-in-swiftui

//OJO: this file will manage both the Bluetooth manager and the peripheral

import Foundation
import CoreBluetooth


class Peripheral: NSObject, Identifiable, CBPeripheralDelegate{
    var id: Int
    var name: String
    var rssi: Int
    var approxDistInMeters: Float //for more info on the conversion between RSSI and distance in meters, read the Notes.docx Word file and the Meters vs RSSI Excel sheet
    var speedCharacteristic: CBCharacteristic?
    var peripheral: CBPeripheral?
    var speedDict: [String: Int]
    var speedStr: String
    var speedInt: UInt8

    init(id: Int, name: String, rssi: Int, approxDistInMeters: Float, approxDistInFeet: Float, initWithPeripheral peripheral: CBPeripheral){
        self.peripheral = peripheral
        self.id = id
        self.name = name
        self.rssi = rssi
        self.approxDistInMeters = approxDistInMeters
        self.speedDict = ["High Speed": 255,
                     "Mid Speed": 170,
                     "Low Speed": 85,
                     "Stopped": 0,
                     "Custom Speed": 0]
        self.speedStr = ""
        self.speedInt = 0
        super.init()
        self.peripheral?.delegate = self
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
    func writeSpeed(speedStr: String) { //OJO: the motor speed goes from 0 to 255
      // See if characteristic has been discovered before writing to it
        speedInt = UInt8(speedDict[speedStr] ?? 0)
        
      if let speedCharacteristic = self.speedCharacteristic {
          let data = Data(_: [speedInt])
          self.peripheral?.writeValue(data, for: speedCharacteristic, type: CBCharacteristicWriteType.withResponse)
      }
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
    //characteristic for sending from the iOS to the Arduino
    var BlackWidowBLETXCBUUID = CBUUID(string: "F38A2C23-BC54-40FC-BED0-60EDDA139F47")
    //No need to initialize the characteristic below. For details, see https://stackoverflow.com/questions/31949303/swift-2-0-initialize-a-cbcharacteristic
    var transmissionCharacteristic: CBCharacteristic?
    //characteristic for receiving data on the iOS side. Not needed.
    //var BlackWidowBLERXCBUUID = CBUUID(string: "A9CD2F86-8661-4EB1-B132-367A3434BC90")
    var servicesArray:[CBUUID]
    var characteristicArray:[CBUUID]
    var blackWidowPeripheral: CBPeripheral!
    var allowTX: Bool
    var setSpeed: Int
    var speedDict: [String: Int]

    override init(){
        
        self.servicesArray = [CBUUID]()
        self.characteristicArray = [CBUUID]()
        self.servicesArray.append(BlackWidowBLECBUUID)
        self.characteristicArray.append(BlackWidowBLETXCBUUID)
        self.allowTX = true
        //self.characteristicArray.append(BlackWidowBLERXCBUUID)
        self.setSpeed = 0
        self.speedDict = [String: Int]()
        self.speedDict = ["High Speed" : 255,
                     "Mid Speed" : 170,
                     "Low Speed" : 85,
                     "Stopped" : 0,
                     "Custom Speed" : 0]
        super.init()
        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
    }
    
    func setCustomSpeed(customSpeed: Int) -> Void{
        speedDict["Custom Speed"] = customSpeed
    }
    
    func setAllowTX(setVal: Bool) -> Void{
        allowTX = setVal
    }
    
    func getAllowTX() -> Bool{
        return allowTX
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn{
            isSwitchedOn = true
        }else{
            isSwitchedOn = false
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String:Any], rssi RSSI: NSNumber) {
        let newPeripheral = Peripheral(id: 0, name: "", rssi: 0, approxDistInMeters: 0.0, approxDistInFeet: 0.0, initWithPeripheral: peripheral)
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
    
    func printServices() -> String{
//        blackWidowPeripheral.discoverServices([BlackWidowBLECBUUID])
//        let arr = blackWidowPeripheral
//        print(arr)
//        for s in servicesArray{
//            print(s)
//        }
        var test = false
        if (test==false){
            return("nil")
        }else{
            return("")
        }
        
    }
    
//    func setAnalogSpeed(speedString: String){
//
//        var speedInt:Int
//        speedInt = 0
//
//        // Valid analog range: 0 to 255
//          // 1
//          if !allowTX {
//            return
//          }
//
//          // 2
//          // Validate value
//          if (speedInt == setSpeed) {
//            return
//          }
//
//          // 3
//          else if ((setSpeed < 0) || (setSpeed > 255)) {
//            return
//          }
//
//          else{
//            speedInt = self.speedDict[speedString]!
//          }
//    }
//
//    func writeAnalogSpeed(vel: UInt8){
//        let data = Data(_: [vel])
//        self.blackWidowPeripheral.writeValue(data, for: transmissionCharacteristic!, type: CBCharacteristicWriteType.withResponse)
//    }
//
//    func setDigitalSpeed(){
//        // Valid position range: 0 to 180
//          // 1
//          if !allowTX {
//            return
//          }
//
//          // 2
//          // Validate value
//          if position == lastPosition {
//            return
//          }
//          // 3
//          else if ((position < 0) || (position > 180)) {
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
//
//    }
//
}
