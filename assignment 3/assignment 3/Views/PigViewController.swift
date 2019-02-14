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
    
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var p1 = Player.init(currentTotal: 0, turnTotal: 0, activePlayer: "Player 1")
    var p2 = Player.init(currentTotal: 0, turnTotal: 0, activePlayer: "Player 2")
    //var cpu = Player.init(currentTotal: 0, turnTotal: 0, activePlayer: "CPU Player)
    
    
    var p1CurrentTot = 0
    var p2CurrentTot = 0
    var activePlayer = 1
    var diceValue = 0
    var turnTotal = 0
    var passTouched = false
    let goalTotal = 100
    var history = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPlayer1.text = p1.activePlayer
        labelPlayer2.text = p2.activePlayer
        history.append("Try to reach \(goalTotal) before the other Player")
        history.append("if you roll a 1 its oink oink 🐖 ")
        updateUI()
        

        // Do any additional setup after loading the view.
        
    }
    //Update the UI
    func updateUI() {
        
        
        labelPlayer1Total.text = "\(p1CurrentTot)"
        labelPlayer2Total.text = "\(p2CurrentTot)"
        labelDiceValue.text = "\(diceValue)"
        labelTurnTotal.text = "\(turnTotal)"
        
        
        
        highlightPlayer()
        isWinner()
        tableView.reloadData()
        scrollToBottom()
        
    }
    
    // highlight active player
    func highlightPlayer(){
        if activePlayer == 1{
            labelPlayer1.textColor = UIColor.red
            labelPlayer2.textColor = UIColor.black
        }else{
            labelPlayer2.textColor = UIColor.red
            labelPlayer1.textColor = UIColor.black
        }
        
    }
    //check who won and display it
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
    //Sart a new game with reseted values
    func newGame(){
        

        p1CurrentTot = 0
        p2CurrentTot = 0
        diceValue = 0
        turnTotal = 0
        labelPlayer1.text = p1.activePlayer
        labelPlayer2.text = p2.activePlayer
        activePlayer = 1
        
        
    }
    
    //Alert to let you know who won the Game
    func alert (title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    //Cpu Game button is also wired up to just start a blank game
    @IBAction func newGame(_ sender: UIButton) {
        
        newGame()
        history = [String]()
        history.append("Somebody Quit and Started a New Game")
        history.append("Try to reach \(goalTotal) before the other Player")
        history.append("if you roll a 1 its oink oink 🐖 ")
        updateUI()
        
    }
    /*
     it just keeps pressing I cant get it to press just once
     func pressRoll(){
        self.rollBtnTouched()
     }
     
     func pressPass(){
     self.passBtnTouched
     }
     */
    
    @IBAction func rollBtnTouched(_ sender: Any/*? = nil*/) {
        
        diceValue = Int.random(in: 1...6)
        diceImageView.image = UIImage(named: "dice\(diceValue)")
        turnTotal = turnTotal + diceValue
        
        if diceValue == 1{
            history.append("Player \(activePlayer) has rolled \(diceValue) PIGOUT🐖")
            
            
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
    
    
    @IBAction func passBtnTouched(_ sender: Any/*? = nil //necessarr for buttonPress func */) {
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
    func scrollToBottom() {
        let numberOfSections = self.tableView.numberOfSections
        let numberOfRows = self.tableView.numberOfRows(inSection: numberOfSections-1)
        if numberOfRows > 0 {
            let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            
        }
    }
    
    
    
    
    
}
