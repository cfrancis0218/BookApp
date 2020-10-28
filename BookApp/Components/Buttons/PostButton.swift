//
//  PostButton.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-12.
//

import UIKit

class PostButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonSetup()
    }
    
    func buttonSetup() {
        self.backgroundColor = .systemBlue
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 12
        self.layer.shadowOpacity = 0.3
        self.setTitle("Post", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
}
