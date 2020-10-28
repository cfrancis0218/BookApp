//
//  HeartButton.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-07.
//

import UIKit

class HeartButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heartButtonSetup()
    }
    
    func heartButtonSetup() {
        self.setImage(UIImage(systemName: "heart.circle.fill"), for: .normal)
        self.tintColor = .systemBlue
        self.setPreferredSymbolConfiguration(.init(pointSize: 35), forImageIn: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 28
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.45
        self.layer.shadowRadius = 15
    }
}
