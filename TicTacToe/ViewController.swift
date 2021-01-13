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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func playButtons(_ sender: Any) {
        //Will keep the game running until all fields are gone.
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
    }

}
