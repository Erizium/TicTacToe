
import UIKit

class TitleScreenViewController: UIViewController {

    @IBOutlet weak var prevCrossScore: UILabel!
    @IBOutlet weak var prevNoughtScore: UILabel!
    @IBOutlet weak var previousScore: UILabel!
    @IBOutlet weak var resumeGameButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    let segueToGame = "segueToGame"
    var lastCrossScore : Int? //saves last games score
    var lastNoughtScore : Int? //
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
            if let crossScore = lastCrossScore, let noughtScore = lastNoughtScore {
                resumeGameButton.isHidden = false
                previousScore.isHidden = false
                prevCrossScore.isHidden = false
                prevNoughtScore.isHidden = false
                
                playButton.setTitle("New game", for: .normal)
                prevNoughtScore.text = "Nought: \(noughtScore)"
                prevCrossScore.text = "Cross: \(crossScore)"
            }
    }
    
    @IBAction func resumeGame(_ sender: Any) {
        performSegue(withIdentifier: segueToGame, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToGame {
            let destinationVC = segue.destination as! ViewController
            
            let resumeCrossScore = lastCrossScore
            destinationVC.resumeCrossScore = resumeCrossScore
            
            let resumeNoughtScore = lastNoughtScore
            destinationVC.resumeNoughtScore = resumeNoughtScore
        }
    }
}
    
    
    
    

