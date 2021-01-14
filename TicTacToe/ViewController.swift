
import UIKit

class ViewController: UIViewController {

    let segueToTitle = "segueToTitle"
    var currentPlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var ongoingGame = true
    var crossScore = 0
    var noughtScore = 0
    var draw = 0
    var resumeNoughtScore: Int?
    var resumeCrossScore: Int?
    
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var rematchButton: UIButton!
    @IBOutlet weak var cScore: UILabel!
    @IBOutlet weak var nScore: UILabel!
    @IBOutlet weak var quitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = resumeCrossScore, let _ = resumeNoughtScore {
            
            crossScore += resumeCrossScore!
            noughtScore += resumeNoughtScore!
            
            cScore.text = "Cross: \(resumeCrossScore!)"
            nScore.text = "Nought: \(resumeNoughtScore!)"
            cScore.isHidden = false
            nScore.isHidden = false
            
        }
    }
    
    let winCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    @IBAction func playButtons(_ sender: Any) {
        //Will keep the game running until all fields are occupied.
        if gameState[(sender as AnyObject).tag-1] == 0 && ongoingGame == true{
            //This places currentPlayer value in gameState
            gameState[(sender as AnyObject).tag-1] = currentPlayer
    
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
            draw += 1
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
                   crossScore += 1
                } else {
                    winner.text = "Nought wins!"
                    noughtScore += 1
                }
                winner.isHidden = false
                rematchButton.isHidden = false
                cScore.text = "Cross: \(crossScore)"
                nScore.text = "Nought: \(noughtScore)"
                quitButton.setTitle("Quit", for: .normal)

            }
        }
        
        if(draw == 9){
            winner.isHidden = false
            rematchButton.isHidden = false
            //quitButton.setTitle("Quit", for: .normal)
            winner.text = "Draw."
            quitButton.setTitle("Quit", for: .normal)
        }
    }

    @IBAction func rematch(_ sender: Any) {
    
        draw = 0
        cScore.isHidden = false
        nScore.isHidden = false
        ongoingGame = true
        winner.isHidden = true
        rematchButton.isHidden = true
        currentPlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]

        for number in 1...9 {
            //sets all the images to nil.
            let button = view.viewWithTag(number) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    @IBAction func quitToTitle(_ sender: Any) {
        performSegue(withIdentifier: segueToTitle, sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToTitle {
            let destinationVC = segue.destination as! TitleScreenViewController
            
            let oldCrossScore = crossScore
            destinationVC.lastCrossScore = oldCrossScore
            
            let oldNoughtScore = noughtScore
            destinationVC.lastNoughtScore = oldNoughtScore
        }
    }
}
