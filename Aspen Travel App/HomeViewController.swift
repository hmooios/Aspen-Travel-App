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
    var popularArray : [String:[String]] = [
        "title":["Alley Place","Coeurdes Alpes"],
        "image": ["popularPlace1","popularPlace2"]
    ]
  
    var recommendedPlacesImage : [String] = [
        "recommendedPlace1","recommendedPlace2"
    ]
    var exploreTitles : [String] = [
    "Explore Aspen","Luxurious Aspen"
    ]
    var durations : [String] = [
    "4N/5D","2N/3D"
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designableSearchView()

    
       
    }
//    override func viewWillAppear(_ animated: Bool) {
//        categoryCollectionView.reloadData()
//        popularCollectionView.reloadData()
//        recommendedCollectionView.reloadData()
//    }
    func designableSearchView(){
        searchView.layer.cornerRadius = searchView.frame.size.height / 2
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categories.count
        } else if collectionView == popularCollectionView {
            return popularArray["title"]?.count ?? 0
        }else if collectionView == recommendedCollectionView{
            return recommendedPlacesImage.count
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
//            cell.placeTitle.text = popularArray["title"]?[indexPath.row]
            cell.popularPlaceImage.image = UIImage(named: popularArray["image"]?[indexPath.row] ?? "star")
           
            return cell
        }else if collectionView == recommendedCollectionView{
            let cell = recommendedCollectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as! MyRecommendedCollectionCell
            cell.recommendedPlaceImage.image = UIImage(named: recommendedPlacesImage[indexPath.row])
            cell.exploreTitle.text = exploreTitles[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
//
//    func collectionView(_ collectionView: UICollectionView,
//                            layout collectionViewLayout: UICollectionViewLayout,
//                            sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize(width: 166, height: 102)
//        }
}


class MyCategoryCollectionCell:UICollectionViewCell{
    
    @IBOutlet var categoryTitle: UILabel!
}

class MyPopularCollectionCell:UICollectionViewCell{

    @IBOutlet var wishlistView: UIView!
    @IBOutlet var popularContentView: UIView!
    @IBOutlet var popularTitleView: UIView!
    @IBOutlet var ratingView: UIView!
    @IBOutlet var popularPlaceImage: UIImageView!
    @IBOutlet var placeTitle: UILabel!
    @IBOutlet var rating: UILabel!
    override func awakeFromNib() {
//        popularTitleView.layer.cornerRadius = 13
//        popularTitleView.layer.masksToBounds = true
//        ratingView.layer.cornerRadius = 13
//         ratingView.layer.masksToBounds = true
//         wishlistView.layer.cornerRadius = 13
//         wishlistView.layer.masksToBounds = true
//         wishlistView.layer.cornerRadius = 13
//         wishlistView.layer.masksToBounds = true
         popularContentView.layer.cornerRadius = 18
         popularContentView.layer.masksToBounds = true
    }
}

class MyRecommendedCollectionCell:UICollectionViewCell{
    
    @IBOutlet var recommendedPlaceImage: UIImageView!

    @IBOutlet var exploreTitle: UILabel!
}

