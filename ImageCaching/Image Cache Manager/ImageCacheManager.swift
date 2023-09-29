import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()
class ImageCacheManager {
    static func downloadImage(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, nil)
        } else {
            ImageCacheManager.downloadData(url: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                } else if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image, nil)
                } else {
                    completion(nil, NSError.imageCacheProcessError(domain: url.absoluteString))
                }
            }
        }
    }

    fileprivate static func downloadData(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession(configuration: .ephemeral).dataTask(with: URLRequest(url: url)) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}

extension NSError {
    static func imageCacheProcessError(domain: String) -> Error {
        return NSError(domain: domain, code: 400, userInfo: [NSLocalizedDescriptionKey : NSLocalizedString("Erro ao processar imagem", comment: "Erro ao processar imagem")])
    }
}
