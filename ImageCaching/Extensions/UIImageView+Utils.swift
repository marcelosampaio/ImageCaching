import UIKit

extension UIImageView {
    func setImage(url: URL) {
        ImageCacheManager.downloadImage(url: url) { image, error in
            if (error != nil) {
                self.image = UIImage()
            } else {
                self.image = image
            }
        }
    }
}
