//
//  ViewController.swift
//  animationapp
//
//  Created by Ritika Verma on 02/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var images: [UIImage] = [] // Array to hold your button images
    var currentIndex = 0 // Index to keep track of current image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images.append(UIImage(named: "Property 1=Default")!) // Replace "image1" with the name of your image assets
        images.append(UIImage(named: "Property 1=Variant2")!) // Replace "image2" with the name of your image assets
        images.append(UIImage(named: "Property 1=Variant3")!) // Replace "image3" with the name of your image assets
        
        // Start the animation
        animateImages()
    }
    
    func animateImages() {
        if currentIndex < images.count {
            UIView.transition(with: imageView,
                              duration: 1,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                guard let self = self else { return }
                self.imageView.image = self.images[self.currentIndex]
            }) { [weak self] _ in
                guard let self = self else { return }
                self.currentIndex += 1
                self.animateImages()
            }
        } else {
            currentIndex = 0
            animateImages()
        }
    }
}
