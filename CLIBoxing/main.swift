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

    print("Enter your name: ")
    var playersName = input()

    let player = Boxer(name: playersName)
    let oppenent = Boxer(name: "Swift")

    println(player._boxer_name + " vs. " + oppenent._boxer_name)
    
}

// Run the main function
main()