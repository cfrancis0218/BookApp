//
//  BookShop.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-06.
//

import UIKit


class BookShop: UIViewController {
    
    var imageData = [
        BookData(title: "ScienceFiction", image: #imageLiteral(resourceName: "0f387215-8a51-4142-adb1-4d05c82a1fc2.sized-1000x1000")),
        BookData(title: "Mystery", image: #imageLiteral(resourceName: "mystery2")),
        BookData(title: "TrueCrime", image: #imageLiteral(resourceName: "truecrime")),
        BookData(title: "Business", image: #imageLiteral(resourceName: "busi")),
        BookData(title: "Science", image: #imageLiteral(resourceName: "scie"))
    ]
    
    
    var detailCard = DetailCard()
    var heartButton = HeartButton()
    var dislikeButton = DislikeButton()
    var commentButton = CommentButton()
    var likeLabel = LikeLabel()
    var dislikeLabel = DislikeLabel()
    var mainImage = UIImageView()
    var genreLabel = GenreLabel()
    var topLabel = TopBookLabel()
    
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionInit = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionInit.translatesAutoresizingMaskIntoConstraints = false
        collectionInit.register(BookCell.self, forCellWithReuseIdentifier: "cell")
        return collectionInit
    }()
    
    // MARK: Main View
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetup()
        detailCardView()
        heartButtonSetup()
        heartButtonConstraints()
        dislikeButtonSetup()
        dislikeButtonConstraints()
        CommentButtonSetup()
        CommentButtonConstraints()
        likeSetup()
        likeConstraints()
        dislikeSetup()
        dislikeConstraints()
        imageSetup()
        imageConstraints()
        
        // Counter
        heartButton.addTarget(self, action: #selector(addLike), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(addDislike), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(makeComment), for: .touchUpInside)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionSetup()
        collectionConstraints()
        genreLabelSetup()
        topLabelSetup()
    }
    
    func topLabelSetup() {
        topLabel.center = CGPoint(x: 0, y: 0)
        topLabel = TopBookLabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        self.view.addSubview(topLabel)
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        topLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400).isActive = true
    }
    
    func genreLabelSetup() {
        genreLabel.center = CGPoint(x: 0, y: 0)
        genreLabel = GenreLabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        self.view.addSubview(genreLabel)
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        genreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        genreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        genreLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -650).isActive = true
    }
    func collectionSetup() {
        collectionView.backgroundColor = .white
        collectionView.indicatorStyle = .white
    }
    
    func collectionConstraints() {
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -480).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.heightAnchor, constant: 40).isActive = true
    }
    
    func viewSetup() {
        detailCard.center = CGPoint(x: 0, y: 0)
        detailCard = DetailCard(frame: CGRect(x: 0, y: 0, width: 150, height: 400))
        self.view.addSubview(detailCard)
    }
    
    func heartButtonSetup() {
        heartButton.center = CGPoint(x: 0, y: 0)
        heartButton = HeartButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.view.addSubview(heartButton)
    }
    
    func heartButtonConstraints() {
        // MARK: Constraints
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 410).isActive = true
        heartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300).isActive = true
        heartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        heartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -345).isActive = true
    }
    
    func dislikeButtonSetup() {
        dislikeButton.center = CGPoint(x: 0, y: 0)
        dislikeButton = DislikeButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.view.addSubview(dislikeButton)
    }
    
    func dislikeButtonConstraints() {
        // MARK: Constraints
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        dislikeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 510).isActive = true
        dislikeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300).isActive = true
        dislikeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        dislikeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -245).isActive = true
    }
    
    func detailCardView() {
        // MARK: Constraints
        detailCard.translatesAutoresizingMaskIntoConstraints = false
        detailCard.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        detailCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        detailCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        detailCard.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func CommentButtonSetup() {
        commentButton.center = CGPoint(x: 0, y: 0)
        commentButton = CommentButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.view.addSubview(commentButton)
    }
    
    func CommentButtonConstraints() {
        // MARK: Constraints
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 610).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300).isActive = true
        commentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        commentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -145).isActive = true
    }
    
    func likeSetup() {
        likeLabel.center = CGPoint(x: 0, y: 0)
        likeLabel = LikeLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        self.view.addSubview(likeLabel)
    }
    
    func likeConstraints() {
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 410).isActive = true
        likeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220).isActive = true
        likeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        likeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -345).isActive = true
    }
    
    func dislikeSetup() {
        dislikeLabel.center = CGPoint(x: 0, y: 0)
        dislikeLabel = DislikeLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        self.view.addSubview(dislikeLabel)
    }
    
    func dislikeConstraints() {
        dislikeLabel.translatesAutoresizingMaskIntoConstraints = false
        dislikeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 510).isActive = true
        dislikeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220).isActive = true
        dislikeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        dislikeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -245).isActive = true
    }
    
    func imageSetup() {
        mainImage = UIImageView(image: #imageLiteral(resourceName: "mainbook"))
        mainImage.contentMode = .scaleAspectFit
        self.view.addSubview(mainImage)
    }
    
    func imageConstraints() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 410).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120).isActive = true
        mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
    }
    
    @objc func makeComment() {
        self.navigationController?.pushViewController(CommentScreen(), animated: true)
    }

    @objc func addLike() {
        likeLabel.text = String(likeLabel.tag)
        likeLabel.tag += 1
    }
    
    @objc func addDislike() {
        dislikeLabel.text = String(dislikeLabel.tag)
        dislikeLabel.tag += 1
    }
}

extension BookShop: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.3, height: collectionView.frame.width/2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCell
        cell.imageData = self.imageData[indexPath.row]
        return cell
    }
}

