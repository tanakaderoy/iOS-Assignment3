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
    @IBOutlet weak var labelDiceValue: UILabel!
    @IBOutlet weak var labelPlayer2Total: UILabel!
    //change dicevalue to turn total
    //create dicevalue
    //change roll and pass to buttons
    
    var p1CurrentTot = 0
    var p2CurrentTot = 0
    var diceValue = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelPlayer1Total.text = "\(p1CurrentTot)"
        labelPlayer2Total.text = "\(p2CurrentTot)"
        labelDiceValue.text = "\(diceValue)"
    }
    

  

}
