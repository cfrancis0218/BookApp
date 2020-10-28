//
//  BookSearch.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-08.
//

import UIKit

class BookSearch: UISearchBar {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        searchBarSetup()
    }
    
    func searchBarSetup() {
        self.barStyle = .default
        self.placeholder = "Search Books"
        self.searchBarStyle = .minimal
        self.searchTextField.textColor = .black
    }
}
