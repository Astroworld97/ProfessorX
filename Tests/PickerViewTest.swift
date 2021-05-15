//
//  PickerViewTest.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/14/21.
//

import SwiftUI

struct PickerViewTest: View {
    
    @State private var selectedFlavor = Flavor.chocolate
    
    var body: some View {
        

        Picker("Flavor", selection: $selectedFlavor) {
            Text("Chocolate").tag(Flavor.chocolate)
            Text("Vanilla").tag(Flavor.vanilla)
            Text("Strawberry").tag(Flavor.strawberry)
        }
        Text("Selected flavor: \(selectedFlavor.rawValue)")
    }
}

//struct PickerViewTest_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerViewTest()
//    }
//}
