
import UIKit

class TitleScreenViewController: UIViewController {

    @IBOutlet weak var prevCrossScore: UILabel!
    @IBOutlet weak var prevNoughtScore: UILabel!
    
    var lastCrossScore : String?
    var lastNoughtScore : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if lastCrossScore != nil {
            prevCrossScore.isHidden = false
            prevNoughtScore.isHidden = false
            
            prevNoughtScore.text = lastNoughtScore
            prevCrossScore.text = lastCrossScore
        } else {
            return
        }
        
    }
  

}
