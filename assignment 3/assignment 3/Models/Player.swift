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
    var activePlayer = 1
    var goalScore = 100
    func finishTurn() {
        currentTotal += turnTotal
        turnTotal = 0
        if activePlayer == 1{
            activePlayer = 2
            
        }else{
            activePlayer = 1
        }
    }
    func pigOut() {
        turnTotal = 0
    }
    func isWinner() -> Bool {
        return currentTotal >= goalScore
        
    }
    
}

