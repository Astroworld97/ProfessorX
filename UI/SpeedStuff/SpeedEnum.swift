//
//  SpeedEnum.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/14/21.
//

enum SpeedEnum: String, CaseIterable, Identifiable {
    case stopped = "Stopped"
    case low = "Low Speed"
    case mid = "Mid Speed"
    case high = "High Speed"
    
    var id: String {
        self.rawValue
    }
}
