//
//  BookCell.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-10.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    var imageData: BookData? {
        didSet {
            guard let imageData = imageData else { return }
            bookImage.image = imageData.image
        }
    }
    
    
    
    
    fileprivate let bookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 12
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bookImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bookImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bookImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
