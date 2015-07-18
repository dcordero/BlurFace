
import UIKit

public class BlurFace {
    
    private let ciDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil ,options: [CIDetectorAccuracy : CIDetectorAccuracyHigh])
    
    private var ciImage: CIImage!
    private var orientation: UIImageOrientation = .Up
    
    private lazy var features : [AnyObject]! = { self.ciDetector.featuresInImage(self.ciImage) }()
    private lazy var context = { CIContext(options: nil) }()
    
    // MARK: Initializers
    
    public init(image: UIImage!) {
        setImage(image)
    }
    
    public func setImage(image: UIImage!) {
        ciImage = CIImage(image: image)
        orientation = image.imageOrientation
        features = nil
    }
    
    // MARK: Public
    
    public func hasFaces() -> Bool {
        return !features.isEmpty
    }
    
    public func blurFaces() -> UIImage {
        let pixelateFiler = CIFilter(name: "CIPixellate")
        pixelateFiler.setValue(ciImage, forKey: kCIInputImageKey)
        pixelateFiler.setValue(max(ciImage!.extent().width, ciImage.extent().height) / 60.0, forKey: kCIInputScaleKey)
        
        var maskImage: CIImage?
        for feature in featureFaces() {
            let centerX = feature.bounds.origin.x + feature.bounds.size.width / 2.0
            let centerY = feature.bounds.origin.y + feature.bounds.size.height / 2.0
            let radius = min(feature.bounds.size.width, feature.bounds.size.height) / 1.5
            
            let radialGradient = CIFilter(name: "CIRadialGradient")
            radialGradient.setValue(radius, forKey: "inputRadius0")
            radialGradient.setValue(radius + 1, forKey: "inputRadius1")
            radialGradient.setValue(CIColor(red: 0, green: 1, blue: 0, alpha: 1), forKey: "inputColor0")
            radialGradient.setValue(CIColor(red: 0, green: 0, blue: 0, alpha: 0), forKey: "inputColor1")
            radialGradient.setValue(CIVector(x: centerX, y: centerY), forKey: kCIInputCenterKey)
            
            let croppedImage = radialGradient.outputImage.imageByCroppingToRect(ciImage.extent())
            
            let circleImage = croppedImage
            if (maskImage == nil) {
                maskImage = circleImage
            }
            else {
                let filter =  CIFilter(name: "CISourceOverCompositing")
                filter.setValue(circleImage, forKey: kCIInputImageKey)
                filter.setValue(maskImage, forKey: kCIInputBackgroundImageKey)
                
                maskImage = filter.outputImage
            }
        }
        
        let composite = CIFilter(name: "CIBlendWithMask")
        composite.setValue(pixelateFiler.outputImage, forKey: kCIInputImageKey)
        composite.setValue(ciImage, forKey: kCIInputBackgroundImageKey)
        composite.setValue(maskImage, forKey: kCIInputMaskImageKey)
        
        let cgImage = context.createCGImage(composite.outputImage, fromRect: composite.outputImage.extent())
        return UIImage(CGImage: cgImage, scale: 1, orientation: orientation)!
    }
    
    // MARK: Private
    
    private func featureFaces() -> [CIFeature] {
        return features as! [CIFeature]
    }
}
