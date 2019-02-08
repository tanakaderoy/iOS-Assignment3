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
    //change dicevalue to turn total
    //create dicevalue
    //change roll and pass to buttons
    
    var p1CurrentTot = 0
    var p2CurrentTot = 0
    var diceValue = 1
    var turnTotal = 0
    var passTouched = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if passTouched == true{
            labelPlayer1Total.text = "\(turnTotal)"
        }
        if diceValue == 1{
            
            diceValue = 0
            turnTotal = 0
        }
        
        updateUI()
    }
    
    
    @IBAction func passBtnTouched(_ sender: Any) {
        passTouched = true
        updateUI()
    }
    

    

}
