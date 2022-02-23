//
//  Archer.swift
//  RPG_Projet3
//
//  Created by chaleroux on 22/02/2022.
//

import Foundation

class Archer: Character {
    override var type: typeCharacter {
        get {
            return .Archer
        }
    }
    init(nameOfCharacter: String) {
        super.init(nameOfCharacter: nameOfCharacter, pointLife: 105, weapon: Bow(), type: .Archer)
    }
    
    override func describeHero() {
        if pointLife > 0 {
        print(" 🏹 " + type.rawValue + " " + nameOfCharacter + " : Life: \(pointLife) - " + weapon.name + " (Power: \(weapon.powerDamage) pts )")
        } else {
            print(" ☠️DEAD☠️ " + type.rawValue + ": " + nameOfCharacter + " : Life: \(pointLife) - " + weapon.name + " (Power: \(weapon.powerDamage) pts)")
        }
    }
}
