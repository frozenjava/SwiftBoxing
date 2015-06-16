//
//  main.swift
//  CLIBoxing
//
//  Created by Joshua Artuso on 6/15/15.
//  Copyright (c) 2015 n3rdcav3. All rights reserved.
//

import Foundation

// Game constants
let _game_name = "CLIBoxing"
let _game_version = 1.0

// Declare a main function
func main() {
    println("\(_game_name) -- Version: \(_game_version)")

    var playersName = input("Enter your name")

    let player = Boxer(name: playersName)
    let oppenent = Boxer(name: "Swift")

    println(player._boxer_name + " vs. " + oppenent._boxer_name)
    
    while player.getHealth() > 0 && oppenent.getHealth() > 0 {
        // Its the players turn first
        getPlayersMove(player, oppenent, player: true)
        
        // Now its the computers turn
        getPlayersMove(oppenent, player, player: false)
    }
    
    println("Game Over")
    
}

// Run the main function
main()