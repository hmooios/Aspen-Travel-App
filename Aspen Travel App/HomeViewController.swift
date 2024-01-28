//
//  HomeViewController.swift
//  Aspen Travel App
//
//  Created by Hmoo Myat Theingi on 25/01/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var searchView: UIView!
    @IBOutlet var searchBoxTextField: UITextField!
    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var recommendedCollectionView: UICollectionView!
    
    var categories : [String] = [
        "Location","Hotels","Food","Adventure","Adventure"
    ]
    var popularPlaces = PopularPlaces()
  
    var recommendedPlacesImages : [String] = [
        "recommendedPlace1","recommendedPlace2","recommendedPlace1","recommendedPlace2"
    ]
    var exploreTitles : [String] = [
    "Explore Aspen","Luxurious Aspen","Explore Aspen","Luxurious Aspen"
    ]
    var durations : [String] = [
    "4N/5D","2N/3D","4N/5D","2N/3D"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        designableSearchView()
    }

    func designableSearchView(){
        searchView.layer.cornerRadius = searchView.frame.size.height / 2
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categories.count
        } else if collectionView == popularCollectionView {
            return popularPlaces.title.count
        }else if collectionView == recommendedCollectionView{
            return recommendedPlacesImages.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! MyCategoryCollectionCell
            cell.categoryTitle.text = categories[indexPath.row]
            return cell
        } else if collectionView == popularCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! MyPopularCollectionCell
            cell.placeTitle.text = popularPlaces.title[indexPath.row]
            cell.popularPlaceImage.image = UIImage(named: popularPlaces.image[indexPath.row])
            cell.rating.text = popularPlaces.ratings[indexPath.row]
           
            return cell
        }else if collectionView == recommendedCollectionView{
            let cell = recommendedCollectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as! MyRecommendedCollectionCell
            cell.recommendedPlaceImage.image = UIImage(named: recommendedPlacesImages[indexPath.row])
            cell.exploreTitle.text = exploreTitles[indexPath.row]
            cell.duration.text = durations[indexPath.row]
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == popularCollectionView{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let popularDetailViewController = storyboard.instantiateViewController(withIdentifier: "PopularDetailViewController") as! PopularDetailViewController
            
            let placeImage = UIImage(named: popularPlaces.image[indexPath.row])
            
            // Set the selected image in PopularDetailViewController
            popularDetailViewController.selectedImage = placeImage
            popularDetailViewController.selectedTitle = popularPlaces.title[indexPath.row]
            
            popularDetailViewController.modalPresentationStyle = .fullScreen
            present(popularDetailViewController, animated: true, completion: nil)
        }
    }


    

    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 166, height: 142)
        }
}


class MyCategoryCollectionCell:UICollectionViewCell{
    
    @IBOutlet var categoryTitle: UILabel!
}

class MyPopularCollectionCell:UICollectionViewCell{

    @IBOutlet var wishlistView: UIView!
    @IBOutlet var popularTitleView: UIView!
    @IBOutlet var ratingView: UIView!
    @IBOutlet var popularPlaceImage: UIImageView!
    @IBOutlet var placeTitle: UILabel!
    @IBOutlet var rating: UILabel!
    @IBOutlet var popularContentView: UIView!
    @IBOutlet var placeView: UIView!
    
    
    override func awakeFromNib() {
//        popularTitleView.layer.cornerRadius = 13
//        popularTitleView.layer.masksToBounds = true
//        ratingView.layer.cornerRadius = 13
//         ratingView.layer.masksToBounds = true
//         wishlistView.layer.cornerRadius = 13
//         wishlistView.layer.masksToBounds = true
//         wishlistView.layer.cornerRadius = 13
//         wishlistView.layer.masksToBounds = true
        popularContentView.layer.cornerRadius = 20
        popularContentView.layer.masksToBounds = true
        placeView.layer.cornerRadius = 15
        placeView.layer.masksToBounds = true
        ratingView.layer.cornerRadius = 15
        ratingView.layer.masksToBounds = true
        wishlistView.layer.cornerRadius = 15
        wishlistView.layer.masksToBounds = true
        
    }
}

class MyRecommendedCollectionCell:UICollectionViewCell{
    
    @IBOutlet var recommendedPlaceImage: UIImageView!
    @IBOutlet var recommendedContentView: UIView!
    
    @IBOutlet var duration: UILabel!
    @IBOutlet var durationBackgroundView2: UIView!
    @IBOutlet var durationBackgroundView1: UIView!
    @IBOutlet var exploreTitle: UILabel!
    override func awakeFromNib() {
        recommendedContentView.layer.cornerRadius = 18
        recommendedContentView.layer.masksToBounds = true
        recommendedContentView.layer.shadowColor = UIColor.lightGray.cgColor
        recommendedContentView.layer.shadowOpacity = 0.5
        recommendedContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        recommendedContentView.layer.shadowRadius = 4
        recommendedContentView.layer.masksToBounds = false
        durationBackgroundView1.layer.cornerRadius = 8
        durationBackgroundView1.layer.masksToBounds = true
        durationBackgroundView2.layer.cornerRadius = 8
        durationBackgroundView2.layer.masksToBounds = true
    }
}

