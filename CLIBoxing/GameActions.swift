//
//  GameActions.swift
//  CLIBoxing
//
//  Created by Joshua Artuso on 6/15/15.
//  Copyright (c) 2015 n3rdcav3. All rights reserved.
//

import Foundation

func input() -> String {
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    var test: String = " hello world   "
    return NSString(data: inputData.trim(), encoding:NSUTF8StringEncoding)!
}

// This isn't how i want it to be yet..
// The players max possible damange should be their strength level
// The percentage of the players stamina left should make it less likely to hit max
// The oppenents stamina left should also decrease the chance of hitting high
func calculateDamange(b1:Boxer, b2:Boxer) -> Int {
    
    var staminaPercent: Int = (b1._boxer_stamina_original / b1._boxer_stamina) * -1
    
    var maxDamage: Int = b1._boxer_strength + staminaPercent
    
    return Int(arc4random_uniform(UInt32(maxDamage)))
}