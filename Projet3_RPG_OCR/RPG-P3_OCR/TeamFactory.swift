//
//  TeamFactory.swift
//  RPG-P3_OCR
//
//  Created by chaleroux on 08/12/2020.
//

import Foundation

final class TeamFactory {
    
    var teamsArray = [Team]()
    var heroesName = [String]()
    var teamName = ""
    
    // METHODS
    // Create two teams
    func createTeams () {
        for n in 0..<2 {
            print("\n► PLAYER \(n + 1)")
            if let team = createTeam() {
                teamsArray.append(team) // Add created team in teamsArray
                
            }
        }
    }
    
    // create a team
    func createTeam() -> Team? {
        let team = Team(nameOfTeam: uniqueName(TeamName: true))
        if let characters = createHeroes() {
            team.characters = characters
        }
        return team
    }
    
    // Player enters unique name for his team
    private func createTeamName() {
        teamName = uniqueName(TeamName: true)
    }
    
    // Add and check unique name for Team or Heroes
    private func uniqueName(TeamName: Bool) -> String {
        var heroName = ""
        repeat {
            if TeamName {
                print("► Choose a name for your team :")
            } else {
                print("► Choose a name for your character :")
            }
            if let data = readLine() {
                heroName = data
                if heroesName.contains(heroName) {
                    print(" ❌ Sorry, but this name has already been used ❌ ")
                    heroName = ""
                } else {
                    heroesName.append(heroName)
                }
            }
        } while heroName == ""
        return heroName
    }
    
    // Menu display
    private func menuListOfHero() {
        print("\n =========================================="
                + "\n Add 3 characters in your team :"
                + "\n1.🪓 Warrior   - Life: 95   - Power : 19 pts"
                + "\n2.🧙🏻‍♂️ Wizard    - Life: 70   - Heal  : 13 pts"
                + "\n3.🏹 Archer    - Life: 105  - Power :  14 pts"
                + "\n =========================================="
                + "\n\n Select number between 1 et 3 :")
    }
    
    private func createHero() -> Character? { //function used to give the right to entry some data
        var userChoice = 0
        menuListOfHero()    //Display the menu with all informations of the characters
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userChoice = dataToInt
                }
            }
        } while userChoice != 1 && userChoice != 2 && userChoice != 3
        let uniqueName = self.uniqueName(TeamName: false) // Add hero's name and check if it is unique in game
        switch userChoice {
        case 1:
            _ = Warrior(nameOfCharacter: uniqueName)
            print("\n✅ \(typeCharacter.Warrior) is now in your team !")
            return Warrior(nameOfCharacter: uniqueName)
        case 2:
            _ = Wizard(nameOfCharacter: uniqueName)
            print("\n✅ \(typeCharacter.Wizard) is now in your team !")
            return Wizard(nameOfCharacter: uniqueName)
        case 3:
            _ = Archer(nameOfCharacter: uniqueName)
            print("\n✅ \(typeCharacter.Archer) is now in your team !")
            return Archer(nameOfCharacter: uniqueName)
        default:
            return nil
        }
    }
    
    // Create 3 heroes and add it to the array
    private func createHeroes() -> [Character]? {
        var heroes = [Character]()
        for _ in 0..<3 {
            if let hero = createHero() {
                heroes.append(hero)
            }
        }
        return heroes
    }
}
