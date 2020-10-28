//
//  TopBookLabel.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-11.
//

import UIKit

class TopBookLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        labelSetup()
    }
    
    func labelSetup() {
        self.text = "Book Of The Month"
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.3
        self.textColor = .black
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    }
}
