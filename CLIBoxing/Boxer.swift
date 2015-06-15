//
//  Boxer.swift
//  CLIBoxing
//
//  Created by Joshua Artuso on 6/15/15.
//  Copyright (c) 2015 n3rdcav3. All rights reserved.
//

import Foundation

class Boxer {
    
    // Declare some constants
    
    // The name of the boxer
    let _boxer_name: String
    
    // The options that the boxer can preform
    let _boxer_moves:[Int:String] = [0:"Punch", 1:"Block", 2:"Stats"]
    
    // The health of the boxer
    var _boxer_health: Int = 100
    
    // The strength of the boxer
    var _boxer_strength: Int = 10
    
    // The stamina of the boxer
    var _boxer_stamina: Int = 10
    
    // The amount of stamina that the boxer originaly had
    let _boxer_stamina_original: Int = 10
    
    init(name:String, hea:Int = 100, str:Int = 10, stam:Int = 10) {
        _boxer_name = name
        _boxer_health = hea
        _boxer_strength = str
        _boxer_stamina = stam
        _boxer_stamina_original = stam
    }
    
    func removeHealth(x:Int) {
        _boxer_health -= x
    }
    
    func removeStamina(x:Int) {
        _boxer_stamina -= x
    }
    
    func getHealth() -> Int {
        return _boxer_health
    }
    
    func getStrength() -> Int {
        return _boxer_strength
    }
    
    func getStamina() -> Int {
        return _boxer_stamina
    }
    
}