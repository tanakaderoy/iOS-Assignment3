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
    
    @IBOutlet weak var tableView: UITableView!
    var p1 = Player.init(currentTotal: 0, turnTotal: 0, activePlayer: "Player 1")
    var p2 = Player.init(currentTotal: 0, turnTotal: 0, activePlayer: "Player 2")
    
    
    var p1CurrentTot = 0
    var p2CurrentTot = 0
    var activePlayer = 1
    var diceValue = 0
    var turnTotal = 0
    var passTouched = false
    let goalTotal = 25
    var history = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPlayer1.text = p1.activePlayer
        labelPlayer2.text = p2.activePlayer
        updateUI()
        

        // Do any additional setup after loading the view.
        
    }
    func highlightPlayer(){
        if activePlayer == 1{
            labelPlayer1.textColor = UIColor.red
            labelPlayer2.textColor = UIColor.black
        }else{
            labelPlayer2.textColor = UIColor.red
            labelPlayer1.textColor = UIColor.black
        }
        
    }
    func isWinner(){
        if p1CurrentTot >= goalTotal{
            history.append("\(p1.activePlayer) Has won \(p1CurrentTot) beats \(goalTotal)")
            alert(title: "Winner", message: "Winner is \(p1.activePlayer)")
            activePlayer = 1
            newGame()
            
        }else if p2CurrentTot >= goalTotal{
            history.append("\(p2.activePlayer) Has won \(p2CurrentTot) beats \(goalTotal)")
            alert(title: "Winner", message: "Winner is \(p2.activePlayer)")
            activePlayer = 2
            newGame()
            
            
        }else{
        
        }
        
    }
    func newGame(){
        

        p1CurrentTot = 0
        p2CurrentTot = 0
        diceValue = 0
        turnTotal = 0
        labelPlayer1.text = p1.activePlayer
        labelPlayer2.text = p2.activePlayer
        activePlayer = 1
        
        
    }
    func alert (title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    func updateUI() {
        
        
        labelPlayer1Total.text = "\(p1CurrentTot)"
        labelPlayer2Total.text = "\(p2CurrentTot)"
        labelDiceValue.text = "\(diceValue)"
        labelTurnTotal.text = "\(turnTotal)"
        tableView.reloadData()
        highlightPlayer()
        isWinner()
        
    }
    @IBAction func newGame(_ sender: UIButton) {
        
        newGame()
        history.append("Somebody Quit and Started a New Game")
        updateUI()
        
    }
    
    @IBAction func rollBtnTouched(_ sender: Any) {
        
        diceValue = Int.random(in: 1...6)
        turnTotal = turnTotal + diceValue
        
        if diceValue == 1{
            history.append("Player \(activePlayer) has rolled \(diceValue) PIGOUT")
            
            
            if activePlayer == 1{
                
                activePlayer = 2
                turnTotal = 0
                
            }else{
                
                activePlayer = 1
                turnTotal = 0
            }
            diceValue = 0
            turnTotal = 0
            
        }
        history.append("Player \(activePlayer) has rolled \(diceValue)")
        
        updateUI()
    
    }
    
    
    @IBAction func passBtnTouched(_ sender: Any) {
        passTouched = true
        if activePlayer == 1{
            if passTouched == true{
                history.append("Player \(activePlayer) has Passed with turnTotal of \(turnTotal)")
                p1CurrentTot = p1CurrentTot + turnTotal
                turnTotal = 0
                passTouched = false
            }
            activePlayer = 2
            
        }else{
            if passTouched == true{
                history.append("Player \(activePlayer) has Passed with turnTotal of \(turnTotal)")
                p2CurrentTot = p2CurrentTot + turnTotal
                turnTotal = 0
                passTouched = false
            }
            activePlayer = 1
        }
        diceValue = 0
        
        
        updateUI()
    }
    

    

}


extension PigViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "historyCell") else {
            preconditionFailure("Cant Find history cell. check reuse id")
        }
        let historyItem = history[indexPath.row]
        cell.textLabel?.text = historyItem
        cell.contentView.backgroundColor = UIColor.gray
        return cell
    }
    
    
    
}
