//
//  ViewController.swift
//  Aspen Travel App
//
//  Created by Hmoo Myat Theingi on 25/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func exploreButtonTapped(_ sender: UIButton) {

       explorePressed()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func explorePressed(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "TabbarController") as! TabbarController
        VC.modalPresentationStyle = .fullScreen
    //    UserStandards.isLogin = true
        self.present(VC, animated: true)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
