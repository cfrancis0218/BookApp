//
//  CommentField.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-12.
//

import UIKit

class CommentField: UITextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textFieldSetup()
    }
    
    func textFieldSetup() {
        self.textColor = .black
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 10
        self.borderStyle = .roundedRect
        self.attributedPlaceholder = NSAttributedString(string: "Leave a comment:", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
}
