//
//  SpeedEnum.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/14/21.
//

enum SpeedEnum: String, CaseIterable, Identifiable {
    case high = "High Speed"
    case mid = "Mid Speed"
    case low = "Low Speed"
    case stopped = "Stopped"
    case custom = "Custom Speed"
    
    var id: String {
        self.rawValue
    }
}
