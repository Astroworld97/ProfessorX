////
////  RemoteControllerView.swift
////  ProfessorX
////
////  Created by Ian Gonzalez on 4/29/21.
////  References: https://www.raywenderlich.com/2164-arduino-tutorial-integrating-bluetooth-le-and-ios-with-swift and https://www.raywenderlich.com/231-core-bluetooth-tutorial-for-ios-heart-rate-monitor
//
//import SwiftUI
//import CoreBluetooth
//var BlackWidowBLECBUUID = CBUUID(string: "025A7775-49AA-42BD-BBDB-E2AE77782966")
//var BlackWidowBLETXCBUUID = CBUUID(string: "F38A2C23-BC54-40FC-BED0-60EDDA139F47")
//var BlackWidowBLERXCBUUID = CBUUID(string: "A9CD2F86-8661-4EB1-B132-367A3434BC90")
//var CBUUIDarray:[CBUUID] = [BlackWidowBLECBUUID, BlackWidowBLETXCBUUID, BlackWidowBLERXCBUUID]
//var alert: Alert {
//        Alert(title: Text("Oops"), message: Text("Error Message"), dismissButton: .default(Text("Dismiss")))
//    }
//var centralManager: CBCentralManager!
//var blackWidowPeripheral: CBPeripheral!
//
//final class RemoteControllerView: View, CBCentralManagerDelegate {
//    
//    @State var leftButtonPressed = false
//    @State var rightButtonPressed = false
//    @State var forwardButtonPressed = false
//    @State var backwardButtonPressed = false
//    @State var stopButtonPressed = false
//    @State var numButtonPressed = 0 //if this value is ever more than 1, reset to zero and show an error notification on screen
//    @State var bcc = DummyBluetoothControlCenter()
//    //@State var centralManager = CBCentralManager(delegate: self, queue: nil)
//    
//    var body: some View {
//        ZStack{
////            Image("nyc")
////                .clipShape(Rectangle())
////                .frame(width: 300, height: 300)
////                .ignoresSafeArea()
//            VStack(alignment: .center){
//                ForwardButton()
//                    //.alignmentGuide(HorizontalAlignment.center, computeValue: {_ in 80})
//                Spacer()
//            .frame(height: 50)
//                HStack{
//                    LeftButton()
//                    Spacer()
//                    StopButton()
//                    Spacer()
//                    RightButton()
//                }
//                Spacer()
//                    .frame(height: 50)
//                BackwardButton()
//                    //.alignmentGuide(HorizontalAlignment.center, computeValue: {_ in 80})
//                    //.alignmentGuide(.custom) { $0[HorizontalAlignment.center] }
//            }
//        }
//    }
//}
//
//extension RemoteControllerView{
//    
//    
//    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//        switch central.state {
//        case .unknown:
//           print("central.state is .unknown")
//         case .resetting:
//           print("central.state is .resetting")
//         case .unsupported:
//           print("central.state is .unsupported")
//         case .unauthorized:
//           print("central.state is .unauthorized")
//         case .poweredOff:
//           print("central.state is .poweredOff")
//         case .poweredOn:
//           print("central.state is .poweredOn")
//           centralManager.scanForPeripherals(withServices: [BlackWidowBLECBUUID])
//        @unknown default:
//          fatalError("fatal error")
//        }
//    }
//    
//    func isEqual(_ object: Any?) -> Bool {
//        <#code#>
//    }
//    
//    var hash: Int {
//        <#code#>
//    }
//    
//    var superclass: AnyClass? {
//        <#code#>
//    }
//    
//    func `self`() -> Self {
//        <#code#>
//    }
//    
//    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//    
//    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//    
//    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//    
//    func isProxy() -> Bool {
//        <#code#>
//    }
//    
//    func isKind(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//    
//    func isMember(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//    
//    func conforms(to aProtocol: Protocol) -> Bool {
//        <#code#>
//    }
//    
//    func responds(to aSelector: Selector!) -> Bool {
//        <#code#>
//    }
//    
//    var description: String {
//        <#code#>
//    }
//    
//    
//}
//
//
//class DummyBluetoothControlCenter: UIViewController{
//    var centralManager: CBCentralManager!
//    var blackWidowPeripheral: CBPeripheral!
//    
//    override func viewDidLoad() {
//        centralManager = CBCentralManager(delegate: self, queue: nil)
//    }
//    
//}
//
//extension DummyBluetoothControlCenter: CBCentralManagerDelegate{
//    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//      switch central.state {
//      case .unknown:
//         print("central.state is .unknown")
//       case .resetting:
//         print("central.state is .resetting")
//       case .unsupported:
//         print("central.state is .unsupported")
//       case .unauthorized:
//         print("central.state is .unauthorized")
//       case .poweredOff:
//         print("central.state is .poweredOff")
//       case .poweredOn:
//         print("central.state is .poweredOn")
//         centralManager.scanForPeripherals(withServices: [BlackWidowBLECBUUID])
//      @unknown default:
//        fatalError("fatal error")
//      }
//    }
//    
//    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
//      print(peripheral)
//      blackWidowPeripheral = peripheral
//      centralManager.stopScan()
//      centralManager.connect(blackWidowPeripheral)
//    }
//    
//    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
//      print("Connected!")
//    }
//}
//
//
//
////struct RemoteControllerView_Previews: PreviewProvider {
////    static var previews: some View {
////        RemoteControllerView()
////    }
////}
