
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var moveActionView: UIView!
    @IBOutlet weak var moveBoyImageView: UIImageView!
    @IBOutlet weak var scaleBoyImageView: UIImageView!
    @IBOutlet weak var rotateBoyImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    
    var duration: Double = 0.8
    let maxDuration: Double = 1.5
    let minDuration: Double = 0.1
    
    var easeParameters:[UICubicTimingParameters] = []
    var easeNames:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // SLIDER VALUE 0.5
        duration = (maxDuration - minDuration) / 2 + minDuration
        // SETUP EASE
        easeParameters = Ease.GetAll()
        easeNames = Ease.GetNames()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: easeNames[(indexPath as NSIndexPath).row])
        let label = cell.contentView.viewWithTag(2) as! UILabel
        label.text = easeNames[(indexPath as NSIndexPath).row]
        return cell
    }
    
    /// -------------
    /// SLIDER
    /// -------------
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        duration = Double(sender.value) * (maxDuration - minDuration) + minDuration
        durationLabel.text = String(Int(duration * 100) * 10) + " ms"
    }
    
    /// -------------
    /// COLLECTION VIEW
    /// -------------
    
    // TAP CELL
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:UICollectionViewCell =  collectionView.cellForItem(at: indexPath)!
        cell.alpha = 0.25
        let animator = UIViewPropertyAnimator(duration: duration, timingParameters: easeParameters[indexPath.row])
        animator.addAnimations ({
            //MOVE
            self.moveBoyImageView.frame.origin = CGPoint(x:(self.moveActionView.frame.width - self.moveBoyImageView.frame.width), y:0)
            //SCALE
            self.scaleBoyImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            //ROTATE
            self.rotateBoyImageView.transform = self.rotateBoyImageView.transform.rotated(by: CGFloat(Double.pi))
        })
        animator.addCompletion({_ in
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            cell.alpha = 1.0
        })
        // init parameters
        self.moveBoyImageView.frame.origin = CGPoint.zero
        self.scaleBoyImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        // start
        animator.startAnimation()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return easeParameters.count;
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }

}

