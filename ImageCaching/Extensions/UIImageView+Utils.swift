//
//  UIImageView+Utils.swift
//  ImageCaching
//
//  Created by Premiersoft on 28/09/23.
//

import UIKit

extension UIImageView {
    func setImage(url: URL) {
        ImageCacheManager.downloadImage(url: url) { image, error in
            DispatchQueue.main.async {
                if (error != nil) {
                    self.image = UIImage()
                } else {
                    self.image = image
                }
            }
        }
    }
}
