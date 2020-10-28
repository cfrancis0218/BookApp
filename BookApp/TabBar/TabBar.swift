//
//  TabBar.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-06.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Navigation()
        tabBarSetup()
    }
    func Navigation() {
        self.title = "Book Shop"
        _ = navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.book.closed.fill"), style: .done, target: self, action: #selector(browseBooks))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.style = .done
        
        view.backgroundColor = .white
        
    }
    
    func tabBarSetup() {
        let bookShop = BookShop()
        bookShop.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "bag"), tag: 0)
        
        
        viewControllers = [bookShop]

    }
    
    @objc func browseBooks() {
        self.navigationController?.pushViewController(BrowseBooksScreen(), animated: true)
    }
    
}
