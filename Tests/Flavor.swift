//
//  Flavor.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 5/14/21.
//

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
}
