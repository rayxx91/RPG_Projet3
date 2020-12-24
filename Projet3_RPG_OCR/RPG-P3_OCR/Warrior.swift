//
//  Warrior.swift
//  RPG-P3_OCR
//
//  Created by chaleroux on 30/11/2020.
//

import Foundation

class Warrior: Character {
    override var type: typeCharacter {
        get {
            return .Warrior
        }
    }
    init(nameOfCharacter: String) {
        super.init(nameOfCharacter: nameOfCharacter, pointLife: 95, weapon: Axe(), type: .Warrior)
    }
    override func describeHero() {
        if pointLife > 0 {
            print(" 🪓 " + type.rawValue + " " + nameOfCharacter + " : Life: \(pointLife) - " + weapon.name + " (Power: \(weapon.powerDamage) pts )")
        } else {
            print(" ☠️DEAD☠️ " + type.rawValue + ": " + nameOfCharacter + " : Life: \(pointLife) - " + weapon.name + " (Power: \(weapon.powerDamage) pts)")
        }
    }
}
