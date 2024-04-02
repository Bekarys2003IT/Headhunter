//
//  TabBarController.swift
//  Headhunter
//
//  Created by Bekarys Sandigali on 22.03.2024.
//

import UIKit
import SnapKit
import RealmSwift

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBars()
        self.tabBar.barTintColor = .lightGray
        self.tabBar.tintColor = UIColor(red: 10/255, green: 153/255, blue: 255/255, alpha: 1)
        self.tabBar.unselectedItemTintColor = UIColor(red: 100/255, green: 101/255, blue: 102/255, alpha: 1)
    }
    func setBars(){
        let searchVC = self.createNav(with: "Search", and:UIImage(systemName:"magnifyingglass"), vc: SearchViewController())
        let favoriteVC = self.createNav(with: "Favorites", and: UIImage(systemName: "heart"), vc: FavoriteViewController())
        let clickVC = self.createNav(with: "Responses", and: UIImage(systemName: "envelope"), vc: ClickViewController())
        let messageVC = self.createNav(with: "Messages", and: UIImage(systemName: "message"), vc: MessageViewController())
        let profileVC = self.createNav(with: "Profile", and: UIImage(systemName: "person"), vc: ProfileViewController())
        self.setViewControllers([searchVC,favoriteVC,clickVC,messageVC,profileVC], animated: true)
    }
    private func createNav(with title:String, and image:UIImage?, vc:UIViewController)->UINavigationController{
        let nav  = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
    
}
