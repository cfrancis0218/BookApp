//
//  GenreLabel.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-11.
//

import UIKit

class GenreLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        labelSetup()
    }
    
    func labelSetup() {
        self.text = "Genre"
        self.textColor = .black
        self.textAlignment = .left
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.3
        self.font = UIFont.systemFont(ofSize: 32, weight: .bold)
    }
}
