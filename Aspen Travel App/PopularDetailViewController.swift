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
    @IBOutlet var popularPlaceOverview: UILabel!
    @IBOutlet var popularPlaceTitle: UILabel!
    @IBOutlet var bookNowButtonView: UIView!
    @IBOutlet var readMoreButton: UIButton!
    
    @IBOutlet var facilitiesCollectionView: UICollectionView!

   // @IBOutlet var facilitiesContentView: UIView!
    
    var facilitiesImage:[String] = [
    "wifi","food","bathTub","pool"
    ]
    var facilitiesTitle:[String] = [
    "1 Heater","Dinner","1 Tub","Pool"
    ]
    
    
    let maxLines: Int = 3
    var isExpanded: Bool = false
      let seeMoreButton: UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
                popularPlaceOverview.text = "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping..."


                if let image = selectedImage, let title = selectedTitle {
                    popularPlaceImage.image = image
                    popularPlaceTitle.text = title
                }

        
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
//        facilitiesContentView.layer.cornerRadius = 10
//        facilitiesContentView.clipsToBounds = true
        
    }
    
    
    @IBAction func readMoreButtonTapped(_ sender: UIButton) {
        isExpanded.toggle()
        updateOverviewText()
    }
    func updateOverviewText() {
        let fullText = "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping."

        if isExpanded {
            popularPlaceOverview.text = fullText
            seeMoreButton.setTitle("See Less", for: .normal)
        } else {
            let truncatedText = String(fullText.prefix(148)) + "..."
            popularPlaceOverview.text = truncatedText
            seeMoreButton.setTitle("See More", for: .normal)
        }
    }

  
    @IBAction func closeButtonTapped(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
       }
    
   
}

class FacilitiesCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet var facilitiesImage: UIImageView!
    @IBOutlet var facilitiesTitle: UILabel!
}

extension PopularDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facilitiesImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = facilitiesCollectionView.dequeueReusableCell(withReuseIdentifier: "facilitiesCell", for: indexPath) as! FacilitiesCollectionViewCell
    
        cell.facilitiesImage.image = UIImage(named: facilitiesImage[indexPath.row])
        cell.facilitiesTitle.text = facilitiesTitle[indexPath.row]

        return cell
    }
    
    
}
