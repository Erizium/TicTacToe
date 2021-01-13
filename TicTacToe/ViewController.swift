//
//  ViewController.swift
//  TicTacToe
//
//  Created by Tobias Österlin on 2021-01-12.
//

import UIKit

class ViewController: UIViewController {

    var currentPlayer = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func playButtons(_ sender: Any) {
        
    
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
