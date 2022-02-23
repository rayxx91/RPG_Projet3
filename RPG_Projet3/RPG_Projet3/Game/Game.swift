//
//  Game.swift
//  RPG_Projet3
//
//  Created by chaleroux on 22/02/2022.
//

import Foundation

class Game {    
    
    var turnNb = 0
    let player = TeamFactory()
    let chest = Chest()
    
    func start() {
        startGame()
        player.createTeams()
        startBattle()
        displayWinner()
        print(" ===   End Of The Fight   === ")
    }
    
    func startGame() {
        print("===   🕹   FIGHT OF THE DAY   🕹   ==="
            + "\n\n ⚔️The game consists to composing 2 teams of 3 characters with a team name and names for each of your characters for a fight to the death.⚔️"
            + "\n 🔓A magic chest will randomly appear in the game allowing you to get a more powerful weapon!🔓"
            + "\n 🤞🏼May the odds be in your favour.🤞🏼")
    }

    // Show Team 1 composition
   func displayTeamOfPlayerOne() {
        player.teamsArray[0].showHeroesInTeam()
    }
    
    // Show Team 2 composition
    func displayTeamOfPlayerTwo() {
        player.teamsArray[1].showHeroesInTeam()
    }
    
    // Resume Heroes in Teams before the battle
    func resumeTeams() {
        print("\n == ⚔️ VOICI LES EQUIPES QUI VONT S'AFFRONTER ⚔️ ==")
        displayTeamOfPlayerOne()
        displayTeamOfPlayerTwo()
    }
    
    // Change Index 0 and 1 of teamsArray
    func changeTeams() {
        player.teamsArray.swapAt(0, 1)
    }
    
    // Player chooses a hero for the battle
    func playerSelection() -> Character {
        var whoWillPlay: Character?
        while whoWillPlay == nil {
            if let userChoice = readLine() {
                
                switch userChoice {
                case "1":
                    whoWillPlay = player.teamsArray[0].characters[0]
                case "2":
                    whoWillPlay = player.teamsArray[0].characters[1]
                case "3":
                    whoWillPlay = player.teamsArray[0].characters[2]
                default:
                    break
                }
                if let chosenHero = whoWillPlay {
                    if chosenHero.pointLife <= 0 {
                        print(" ⚠️ This character is dead, you must choose an other one. ⚰️ ")
                        whoWillPlay = nil // The player can't select a character without life point
                    }
                }
            }
        }
        return whoWillPlay!
    }

    // Loop for the Battle
    func startBattle() {
        print("\n=== ⚔️ THE FIGHT CAN START ⚔️ ===")
        repeat {
            displayTeamOfPlayerOne()
            print("\n Choose a character in your team (select 1, 2 ou 3) ")
            let myCharacter = playerSelection() // First team selects hero to play (enter number 1, 2 or 3)
            if chest.chestAppearsTwice(to: myCharacter) == false {
                chest.randomChest(for: myCharacter) // If the chest appears when hero is selected, he gets a new weapon
            }
            if let wizard = myCharacter as? Wizard { // If the chosen Hero is Magus, he heals someone from his team
                displayTeamOfPlayerOne()
                print("\n Choose a character in your team to heal (tap 1, 2 or 3)")
                let heroToHeal = playerSelection() // Player chooses hero to heal in his team
                wizard.heal(heroToHeal: heroToHeal)
                changeTeams()
            } else {  // Else, if the chosen hero is not Magus, attack the enemy
               
                print("\n Choose your opponent (tap 1, 2 or 3)")
                changeTeams()
                let heroToAttack = playerSelection() // Player chooses hero for attack on enemy team
                myCharacter.attack(heroToAttack: heroToAttack)
                turnNb += 1
                
            }
        } while endOfGame() // repeat while it's still a hero alive on a team
    }
    
    // Check if all heroes on a team are dead
    func endOfGame() -> Bool {
        let teamIsDead = false
        for i in 0..<player.teamsArray.count {
            let player1 = player.teamsArray[i]
            let player2 = player.teamsArray[i+1]
            if player1.isDead() {   // If all heroes on the first team are dead, game ends and team 2 wins
                messageForWinner(name: player2.nameOfTeam)
                return teamIsDead == true
            } else if player2.isDead() { // Else if all heroes on the second team are dead, game ends and team 1 wins
                messageForWinner(name: player1.nameOfTeam)
                return teamIsDead == true
            } else { // Else game continues
                return teamIsDead == false
            }
        }
        return teamIsDead
    }
    
    func messageForWinner(name: String) {
        print("\n\n === 🏆 CONGRATULATION TEAM \(name), YOU WON ! 🏆 === ")
    }
        
    //function used to display the statistics of the game
    func displayWinner() {
        print("/n/n=======================")
        print("⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️")
        print(" Statistics Of the Game:")
        print("\(displayTeamOfPlayerOne())")
        print("\(displayTeamOfPlayerTwo())")
        print(" Number of turn: \(turnNb)")
        print("⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️")
        print("===========================")
    }
}
