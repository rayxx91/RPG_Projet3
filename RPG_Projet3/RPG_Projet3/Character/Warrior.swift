//
//  Warrior.swift
//  RPG_Projet3
//
//  Created by chaleroux on 22/02/2022.
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
