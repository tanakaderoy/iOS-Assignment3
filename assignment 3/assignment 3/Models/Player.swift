//
//  Player.swift
//  assignment 3
//
//  Created by Student on 2/8/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Player{
    var currentTotal = 0
    var turnTotal = 0
    var activePlayer = ""
    
    init(currentTotal: Int, turnTotal: Int, activePlayer: String) {
        self.currentTotal = currentTotal
        self.turnTotal = turnTotal
        self.activePlayer = activePlayer
    }
   
    
}

