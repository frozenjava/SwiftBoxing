//
//  GameActions.swift
//  CLIBoxing
//
//  Created by Joshua Artuso on 6/15/15.
//  Copyright (c) 2015 n3rdcav3. All rights reserved.
//

import Foundation

func input(promt:String) -> String {
    print(promt + ": ")
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    var stringData = NSString(data: inputData, encoding:NSUTF8StringEncoding)!
    let trimmed = stringData.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    return trimmed
}

// This isn't how i want it to be yet..
// The players max possible damange should be their strength level
// The percentage of the players stamina left should make it less likely to hit max
// The oppenents stamina left should also decrease the chance of hitting high
func calculateDamange(b1:Boxer, b2:Boxer) -> Int {
    
    var staminaPercent: Int = (b1._boxer_stamina_original / b1._boxer_stamina) * -1
    
    var maxDamage: Int = b1._boxer_strength + staminaPercent
    
    if b2._boxer_attempt_block {
        b2._boxer_attempt_block = false
        var blocked = Int(arc4random_uniform(1))
        if blocked == 1 {
            maxDamage = 0
        } else {
            b2.removeStamina(1)
        }
    }
    
    // Make sure that the max hit isn't greater than the opponents health
    if maxDamage > b2.getHealth() {
        maxDamage = b2.getHealth()
    }
    
    return Int(arc4random_uniform(UInt32(maxDamage)))
}

func getPlayersMove(b1:Boxer, b2:Boxer, player:Bool=false) {
    
    if !b1.isLivin() || !b2.isLivin() {
        return
    }
    
    // If its the players turn do this
    if player == true {
        var validChoice = false
        while !validChoice {
            println("1. Punch")
            println("2. Block")
            println("3. Stats")
            var playersChoice = input("YOUR MOVE").toInt()
            validChoice = handlePlayerMove(b1, b2, playersChoice!, playersMove: player)
        }
    } else {
        var computersChoice = (String(arc4random_uniform(UInt32(2))).toInt())! + 1
        handlePlayerMove(b1, b2, computersChoice, playersMove: player)
    }
}

func handlePlayerMove(b1:Boxer, b2:Boxer, choice:Int, playersMove:Bool = false) -> Bool {
    
    var validChoice = false
    
    // This is horrible and people should stab me for doing this
    // I am way to lazy to refactor my code right now and its late
    // I will hate myself another day
    var player = playersMove
    
    switch(choice) {
        // Punch
        case 1:
            validChoice = true
            var damage:Int = calculateDamange(b1, b2)
            if player == false && damage == 0 {
                println("You blocked the punch!")
            } else if player == true && damage == 0 {
                println("Your opponent blocked the punch")
            } else if player == false && damage > 0 {
                println("Your opponent hit a \(damage)")
            } else if player == true && damage > 0 {
                println("You hit a \(damage)")
            }
            b2.removeHealth(damage)
            b1.removeStamina(1)
            break
        
        // Block
        case 2:
            validChoice = true
            if player == true {
                println("You attempt to block the punch...")
            }
            b1._boxer_attempt_block = true
            break
        
        // Stats
        case 3:
            println("-------------------------------")
            print("Your Stats\t\t")
            println("Opponents Stats")
            print("HEALTH: \(b1._boxer_health)\t\t")
            println("HEALTH: \(b2._boxer_health)")
            print("STAMINA: \(b1._boxer_stamina)\t\t")
            println("STAMINA: \(b2._boxer_stamina)")
            println("-------------------------------")
            break
        
        // Unkown
        default:
            println("Unkown option: \(choice)")
            break
    }
    
    return validChoice
    
}