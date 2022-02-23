//
//  Wizard.swift
//  RPG_Projet3
//
//  Created by chaleroux on 22/02/2022.
//

import Foundation

class Wizard: Character {
    override var type: typeCharacter {
        get {
            return .Wizard
        }
    }
    init(nameOfCharacter: String) {
        super.init(nameOfCharacter: nameOfCharacter, pointLife: 70, weapon: Magic(), type: .Wizard)
    }
    
    // METHODS
    // Method for Magus when he heals someone from his team. Hero's life points can't be more than his max life points
    func heal(heroToHeal: Character) {
        heroToHeal.pointLife += weapon.powerHeal
        if heroToHeal.pointLife >= heroToHeal.maxOfLife {
            heroToHeal.pointLife = heroToHeal.maxOfLife
        }
        print("\(heroToHeal.type) \(heroToHeal.nameOfCharacter) is care and is currently at \(heroToHeal.pointLife) points of life")
    }
    
    override func describeHero() {
        if pointLife > 0 {
            print(" 🧙🏻‍♂️ " + type.rawValue + " " + nameOfCharacter + " : Life: \(pointLife) - " + weapon.name + " (Heal: \(weapon.powerHeal) pts )")
        } else {
            print(" ☠️DEAD☠️ " + type.rawValue + ": " + nameOfCharacter + " : Life: \(pointLife) - " + weapon.name + " (Heal: \(weapon.powerHeal) pts)")
        }
        
    }
}
