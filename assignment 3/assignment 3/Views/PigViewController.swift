//
//  PigViewController.swift
//  assignment 3
//
//  Created by Student on 2/5/19.
//  Copyright © 2019 Tanaka. All rights reserved.
//

import UIKit

class PigViewController: UIViewController {

    @IBOutlet weak var labelPlayer1Total: UILabel!
    @IBOutlet weak var labelPlayer1: UILabel!
    
    @IBOutlet weak var labelTurnTotal: UILabel!
    @IBOutlet weak var labelDiceValue: UILabel!
    @IBOutlet weak var labelPlayer2: UILabel!
    @IBOutlet weak var labelPlayer2Total: UILabel!
    
    var p1 = Player.init(currentTotal: 0, turnTotal: 0, activePlayer: "Player 11")
    var p2 = Player.init(currentTotal: 0, turnTotal: 0, activePlayer: "Player 22")
    
    
    var p1CurrentTot = 0
    var p2CurrentTot = 0
    var activePlayer = 1
    var diceValue = 0
    var turnTotal = 0
    var passTouched = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPlayer1.text = p1.activePlayer
        labelPlayer2.text = p2.activePlayer
        updateUI()
        

        // Do any additional setup after loading the view.
        
    }
    func updateUI() {
        
        
        labelPlayer1Total.text = "\(p1CurrentTot)"
        labelPlayer2Total.text = "\(p2CurrentTot)"
        labelDiceValue.text = "\(diceValue)"
        labelTurnTotal.text = "\(turnTotal)"
        
    }
    
    @IBAction func rollBtnTouched(_ sender: Any) {
        
        diceValue = Int.random(in: 1...6)
        turnTotal = turnTotal + diceValue
        
        if diceValue == 1{
            
            diceValue = 0
            turnTotal = 0
            if activePlayer == 1{
                
                activePlayer = 2
                turnTotal = 0
                
            }else{
                
                activePlayer = 1
                turnTotal = 0
        }
        }
        
        updateUI()
    
    }
    
    
    @IBAction func passBtnTouched(_ sender: Any) {
        passTouched = true
        if activePlayer == 1{
            if passTouched == true{
                p1CurrentTot = p1CurrentTot + turnTotal
                turnTotal = 0
                passTouched = false
            }
            activePlayer = 2
            
        }else{
            if passTouched == true{
                p2CurrentTot = p2CurrentTot + turnTotal
                turnTotal = 0
                passTouched = false
            }
            activePlayer = 1
        }
        
        
        updateUI()
    }
    

    

}
