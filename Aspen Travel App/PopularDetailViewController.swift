//
//  PupularDetailViewController.swift
//  Aspen Travel App
//
//  Created by Hmoo Myat Theingi on 28/01/2024.
//

import UIKit

class PopularDetailViewController: UIViewController {
    //var popularPlace:PopularPlaces?
    var selectedImage: UIImage?
    var selectedTitle: String?

    @IBOutlet var backView: UIView!
    @IBOutlet var popularPlaceImage: UIImageView!
    @IBOutlet var wishlistView: UIView!

    @IBOutlet var popularPlaceTitle: UILabel!
    
    @IBOutlet var bookNowButtonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = selectedImage,
           let title = selectedTitle
        {
            popularPlaceImage.image = image
            popularPlaceTitle.text = title
            
        }
        popularPlaceImage.layer.cornerRadius = 20
        popularPlaceImage.clipsToBounds = true
        backView.layer.cornerRadius = 3
        backView.clipsToBounds = true
        wishlistView.layer.cornerRadius = 25
        wishlistView.clipsToBounds = true
        wishlistView.layer.shadowColor = UIColor.systemBlue.cgColor
        wishlistView.layer.shadowOpacity = 0.2
        wishlistView.layer.shadowOffset = CGSize(width: 2, height: 2)  // Positive values for right and bottom
        wishlistView.layer.shadowRadius = 2
        wishlistView.layer.masksToBounds = false
        bookNowButtonView.layer.cornerRadius = 10
        bookNowButtonView.clipsToBounds = true
        
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
       }
    
}
