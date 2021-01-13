//
//  ViewController.swift
//  TicTacToe
//
//  Created by Tobias Österlin on 2021-01-12.
//

import UIKit

class ViewController: UIViewController {

    var currentPlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var ongoingGame = true
    
    @IBOutlet weak var winner: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    let winCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    @IBAction func playButtons(_ sender: Any) {
        //Will keep the game running until all fields are occupied.
        if gameState[(sender as AnyObject).tag] == 0 && ongoingGame == true{
            //This places currentPlayer value in gameState
            gameState[(sender as AnyObject).tag] = currentPlayer
    
            if currentPlayer == 1 {
                (sender as AnyObject).setImage(UIImage(
                                named: "cross.png"),
                            for: UIControl.State())
                currentPlayer = 2
            
            } else {
                (sender as AnyObject).setImage(UIImage(
                                named: "nought.jpeg"),
                            for: UIControl.State())
                currentPlayer = 1
            }
        }
        
        for combination in winCombos{
            //checks each array in winCombos to see if gameState has same values on those 3 places
            //For example 0,1,2
            //gameState[1,1,1,0,0,0,0,0,0] player 1 wins.
            //gameState[2,2,2,0,0,0,0,0,0] player 2 wins.
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                ongoingGame = false
                
                //checks who the winner is
                if gameState[combination[0]] == 1 {
                    winner.text = "Cross wins!"
                   
                } else {
                    winner.text = "Nought wins!"
                
                }
                winner.isHidden = false
                
            }
        }
        
    }

}
