//
//  LikeLabel.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-08.
//

import UIKit

class LikeLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        labelSetup()
    }
    
    func labelSetup() {
        self.text = "0"
        self.textColor = .black
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    }
}
