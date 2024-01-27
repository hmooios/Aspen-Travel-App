//
//  ViewController.swift
//  Aspen Travel App
//
//  Created by Hmoo Myat Theingi on 24/01/2024.
//

import UIKit

class TravelViewController: UIViewController {

    @IBOutlet var viewForTab: UIView!
    @IBOutlet var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        designableTabBar()
        DispatchQueue.main.async {
            self.homeTabbarTapped()
        }
    }
    
    func designableTabBar(){
        viewForTab.layer.cornerRadius = viewForTab.frame.size.height/2
        viewForTab.clipsToBounds=true
    }
    func homeTabbarTapped(){
        guard let Home = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") else { return }
        self.addChild(Home)
        contentView.addSubview(Home.view)
        Home.didMove(toParent: self)
    }
    func ticketTabbarTapped(){
      
        guard let Ticket = storyboard?.instantiateViewController(withIdentifier: "TicketViewController") else { return }
        self.addChild(Ticket)
        contentView.addSubview(Ticket.view)
        Ticket.didMove(toParent: self)
    }
    
    func wishlistTabbarTapped(){
        guard let Wishlist = storyboard?.instantiateViewController(withIdentifier: "WishlistViewController") else { return }
        self.addChild(Wishlist)
        contentView.addSubview(Wishlist.view)
        Wishlist.didMove(toParent: self)
    }
    
    func profileTabbarTapped(){
        guard let Profile = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") else { return }
        self.addChild(Profile)
        contentView.addSubview(Profile.view)
        Profile.didMove(toParent: self)
    }
    @IBAction func tabBarTapped(_ sender: UIButton) {
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        let tag = sender.tag
        if tag == 1{
           homeTabbarTapped()
        }else if tag == 2{
            ticketTabbarTapped()
        }else if tag == 3{
            wishlistTabbarTapped()
        }else{
           profileTabbarTapped()
        }
    }
    
}
 
