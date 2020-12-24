//
//  Archer.swift
//  RPG-P3_OCR
//
//  Created by chaleroux on 30/11/2020.
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
