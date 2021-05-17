//
//  JoystickCustomTest.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/16/21.
//

import SwiftUI
import SFSafeSymbols
import OMJoystick

struct JoystickCustomTest: View {
    
    let iconSetting = IconSetting(
            leftIcon: Image(systemSymbol: .arrowLeft),
            rightIcon: Image(systemSymbol: .arrowRight),
            upIcon: Image(systemSymbol:.arrowUp),
            downIcon: Image(systemSymbol: .arrowDown)
        )
    
    let colorSetting = ColorSetting(subRingColor: .red, bigRingNormalBackgroundColor: .green, bigRingDarkBackgroundColor: .blue, bigRingStrokeColor: .yellow)

    
    var body: some View {
          GeometryReader { geometry in
            VStack(alignment: .trailing, spacing: 5) {
                  OMJoystick(isDebug: true, iconSetting: self.iconSetting,  colorSetting: ColorSetting(), smallRingRadius: 70, bigRingRadius: 120
                  ) { (joyStickState, stickPosition)  in
                      
                  }.frame(width: 315, height: 315)
              }
          }
      }
  }

//struct JoystickCustomTest_Previews: PreviewProvider {
//    static var previews: some View {
//        JoystickCustomTest()
//    }
//}
