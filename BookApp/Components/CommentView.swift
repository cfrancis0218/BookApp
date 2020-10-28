//
//  CommentView.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-12.
//

import UIKit

class CommentView: UITextView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        textViewSetup()
    }
    
    func textViewSetup() {
        self.textColor = .black
        self.backgroundColor = .clear
        self.isEditable = false
        self.isSelectable = false
        self.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
}
