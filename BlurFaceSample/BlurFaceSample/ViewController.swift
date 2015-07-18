
import UIKit
import BlurFace

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var blurButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    private var blurFace: BlurFace?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage(UIImage(named: "TheHoff"))
    }
    
    // MARK: Actions
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func blurButtonTapped(sender: UIButton) {
        imageView.image = blurFace!.blurFaces()
    }
    
    // MARK: Private
    
    func setupImage(image: UIImage!) {
        imageView.image = image
        blurButton.enabled = blurImageWithImage(image).hasFaces()
    }
    
    func blurImageWithImage(image: UIImage) -> BlurFace {
        if let blurFace = blurFace {
            blurFace.setImage(image)
        }
        else {
            blurFace = BlurFace(image: image)
        }
        return blurFace!
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        setupImage(info[UIImagePickerControllerOriginalImage] as! UIImage)
    }
}

