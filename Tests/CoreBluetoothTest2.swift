//
//  CoreBluetoothTest2.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/28/21.
//

import SwiftUI
import CoreBluetooth

struct CoreBluetoothTest2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class CB: CBCentralManagerDelegate{
    func isEqual(_ object: Any?) -> Bool {
        <#code#>
    }
    
    var hash: Int
    
    var superclass: AnyClass?
    
    func `self`() -> Self {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func isProxy() -> Bool {
        <#code#>
    }
    
    func isKind(of aClass: AnyClass) -> Bool {
        <#code#>
    }
    
    func isMember(of aClass: AnyClass) -> Bool {
        <#code#>
    }
    
    func conforms(to aProtocol: Protocol) -> Bool {
        <#code#>
    }
    
    func responds(to aSelector: Selector!) -> Bool {
        <#code#>
    }
    
    var description: String
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        <#code#>
    }
    
    var centralManager: CBCentralManager
    var powered_on: Bool
    var scanning: Bool
    var connected: Bool
    
    init(){
        powered_on = false
        scanning = false
        connected = false
        
        self.centralManager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionRestoreIdentifierKey:"BDSK"])
    }
    
    
}






//
//struct CoreBluetoothTest2_Previews: PreviewProvider {
//    static var previews: some View {
//        CoreBluetoothTest2()
//    }
//}
