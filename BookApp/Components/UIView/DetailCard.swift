//
//  DetailCard.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-07.
//

import UIKit

class DetailCard: UIView {
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        detailCard()
    }
    
    
    func detailCard() {
        
        // MARK: Styling
        self.backgroundColor = .white
        self.layer.cornerRadius = 25
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 15
        
    }
}
