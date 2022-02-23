//
//  Character.swift
//  RPG_Projet3
//
//  Created by chaleroux on 22/02/2022.
//

import Foundation

enum typeCharacter:String{
    case Archer = "Archer"
    case Wizard  = "Wizard"
    case Warrior = "Warrior"
    case NotSet = "notSet"
}

class Character {
    var nameOfCharacter: String
    var pointLife: Int
    let maxOfLife: Int
    var weapon: Weapon
    var type: typeCharacter {           //Differents types of Character: Warrrior, Archer and Wizard
        //get {
            .NotSet
       // }
    }
    //Initialize
    internal init(nameOfCharacter: String, pointLife: Int, weapon: Weapon, type: typeCharacter){
        self.nameOfCharacter = nameOfCharacter
        self.pointLife = pointLife
        self.maxOfLife = pointLife
        self.weapon = weapon
    }
    
    // METHODS
    // Describe Hero
    func describeHero() {
        print(" " + type.rawValue + " " + nameOfCharacter + " : Life: \(pointLife) - " + weapon.name + " (Power: \(weapon.powerDamage) pts )")
    }

    
    // Function use to Attack the enemy
    func attack(heroToAttack: Character) {
        heroToAttack.pointLife -= weapon.powerDamage
        heroToAttack.checkLifeCharacter()
    }
    
    // Set pointLife to 0 if it's under 0
    func checkLifeCharacter() {
        if self.pointLife <= 0 {
            self.pointLife = 0
        } else {
            print("\(nameOfCharacter), the \(type) has currently \(pointLife) points of life")
        }
    }
}
