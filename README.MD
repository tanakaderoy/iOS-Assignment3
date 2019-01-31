# Assignment 3

Assigned: 1/31/2019
Due: 2/14/2019
Points: 200

## Purpose
Create a UIView based iOS app using common UIKit controls.

## Program structure
Create an iOS Single View App.  Use the storyboard to design your UI.  At a minimum, you will have a model class for Player.  A model class should have no references or dependencies to the UI.

## Problems
Create an iOS app that allows two human players to play Pig by passing the phone back and forth or one human play against the computer.

1. (50 points) Create a UI in Interface builder.  The layout is up to you.  No warnings in interface builder.  Each warning is a 1 point deduction.  Use autolayout constraints.  Your layout should render properly on iPhone 4s and above (including iPads).  Each form factor your UI does not layout in properly is a 5 point deduction.  You do not need to support landscape.  Feel free to be creative with you layout and colors.
On the screen, show:
  * The title of the game: "Pass the Pigs"
  * Names of each player and indicate which player is active
  * Each players current total
  * The active players turn total
  * The value of the roll of the dice
  * Buttons to Roll, Pass, and start a new game
  * A table to show the history
  

2. (80 points) Implement the game logic.  You will need at least one model class: Player.  A model class must not have any reference to the UI.  A model only stores data and logic.  In your view controller, implement an updateUI function.  All UI updates should happen from this function.
  * Roll button rolls the dice creating a random number between 1 and 6.  If 1 is rolled, the player pigs out and it is the next players turn.
  * If 2 - 6 is rolled the value is added to the player's turn score.  Be sure to update the player's turn score on screen.  The player can now choose to roll again or pass.
  * If the Pass button is touched, the player's turn score is added to thier total and it is the next players turn.
  * When a player passed and has a total of 100 or above the game is over.  Display an Alert congradulating the player and reset the game. 
  * At any time, touching the New Game button resets the game.


3. (50 points) Keep a history log
 * Record a history of the game actions and display in an UITableView
 * At a minimum record each dice roll and a players decision to Roll or Pass


 4. (20 points) Add the ability to play against the computer.
 * Add a way to the UI to switch back and forth from Player 2 to Computer player
 * Implement some basic AI for the computer play the game.  Feel free to use the same method you used in our class room competition. 

