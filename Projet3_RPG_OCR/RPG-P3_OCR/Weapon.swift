//
//  Weapon.swift
//  RPG-P3_OCR
//
//  Created by chaleroux on 30/11/2020.
//

import Foundation

//Players needs weapons to the battle
//weapon has a name and a power

class Weapon {
    let name: String //name of the weapon
    let powerDamage: Int //power of the weapon, depend of the character
    let powerHeal: Int //power of care, specially for the Wizard
    
    init(name: String, powerDamage: Int, powerHeal: Int) {
        self.name = name
        self.powerDamage = powerDamage
        self.powerHeal = powerHeal
    }
    
    func descriptionOfWeapons(of character: Character) {
        switch character {
        case is Wizard:
            print("Thank's to the chest, you have a new weapon : " + name + " (Care : \(powerHeal) pts)")
        case is Warrior, is Archer:
            print("Thank's to the chest, you have a new weapon : " + name + " (Damage : \(powerDamage) pts)")
        default:
            break
        }
    }
}
