//
//  Chest.swift
//  RPG_Projet3
//
//  Created by chaleroux on 22/02/2022.
//

import Foundation

class Chest {
    
    // A chest appears, Hero gets a new weapon
    func randomChest(for character: Character) {
        let random = Int.random(in: 0...8)
        //let randomChest = Int(arc4random_uniform(8))
        if random == 6 { // The chest appears in the game if number 6 appear
            print("\n== 🔑 THIS IS THE MAGIC CHEST 🔑 ==")
            switch character {
            case is Warrior:
                character.weapon = GoldAxe()
            case is Wizard:
                character.weapon = GoldMagic()
            case is Archer:
                character.weapon = GoldBow()
            default:
                break
            }
            character.weapon.descriptionOfWeapons(of: character)
        }
    }
    
    func chestAppearsTwice(to myCharacter: Character) -> Bool {
        switch myCharacter.weapon {
        case is GoldAxe, is GoldMagic, is GoldBow:
            changeWeapon(of: myCharacter)
            return true
        default:
            return false
        }
    }
    
    // If chest appears a second time for the same character, he recovers his basic weapon
    func changeWeapon(of character: Character) {
        print("\n 🔑❌ Sorry, you already have the gold weapon then you get back the basic weapon ❌🔑")
        switch character {
        case is Warrior:
            character.weapon = Axe()
        case is Wizard:
            character.weapon = Magic()
        case is Archer:
            character.weapon = Bow()
        default:
            break
        }
        character.weapon.descriptionOfWeapons(of: character)
    }
}
