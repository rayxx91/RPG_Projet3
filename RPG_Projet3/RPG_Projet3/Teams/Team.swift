//
//  Team.swift
//  RPG_Projet3
//
//  Created by chaleroux on 22/02/2022.
//

import Foundation

class Team {
    var nameOfTeam: String
    var characters = [Character]()

    
    init(nameOfTeam: String) {
        self.nameOfTeam = nameOfTeam
    }
    
    // METHODS
    // Method to show heroes in team with their descriptions
    func showHeroesInTeam() {
        print("\n EQUIPE \(nameOfTeam) :")
        for hero in characters {
            hero.describeHero()
        }
    }
    
    //This function verify if the character is dead or not with a bool
    func isDead() -> Bool {
        var isDead = false
        for character in characters {
            if character.pointLife <= 0 {
                isDead = true
            } else {
                return false
            }
        }
        return isDead
    }
}
