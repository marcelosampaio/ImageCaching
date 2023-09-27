//
//  ViewController.swift
//  ImageCaching
//
//  Created by Premiersoft on 27/09/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    private var defaultImage = "defaultImage"
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: defaultImage)
    }
    
    // MARK: - UI Actions
    @IBAction func process(_ sender: Any) {
        print("🌴 engine start up")
    }
    
    @IBAction func imageToDefault(_ sender: Any) {
        imageView.image = UIImage(named: defaultImage)
    }
    
    @IBAction func cleanCacheAndMemory(_ sender: Any) {
        imageView.image = UIImage()
    }
    
}
