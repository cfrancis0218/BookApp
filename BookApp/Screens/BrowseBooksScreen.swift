//
//  BrowseBooksScreen.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-06.
//

import UIKit

class BrowseBooksScreen: UIViewController, UISearchResultsUpdating {

    var searchBar = BookSearch()
    var searchItems: [String]?
    var filteredGenres: [String]?
    
    var imageData = [
        BookData(title: "Science Fiction", image: #imageLiteral(resourceName: "0f387215-8a51-4142-adb1-4d05c82a1fc2.sized-1000x1000")),
        BookData(title: "Mystery", image: #imageLiteral(resourceName: "mystery2")),
        BookData(title: "True Crime", image: #imageLiteral(resourceName: "truecrime")),
        BookData(title: "Business", image: #imageLiteral(resourceName: "busi")),
        BookData(title: "Science", image: #imageLiteral(resourceName: "scie"))
    ]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionInit = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionInit.translatesAutoresizingMaskIntoConstraints = false
        collectionInit.register(BookCell.self, forCellWithReuseIdentifier: "cell")
        return collectionInit
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchItems = ["Science Fiction", "Mystery", "True Crime", "Business", "Science"]
        self.view.backgroundColor = .white
        searchBarView()
        searchBarConstraints()
        toolBarSetup()
        collectionSetup()
        collectionConstraints()
        
        collectionView.delegate = self
        collectionView.dataSource = self
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
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.heightAnchor, constant: 40).isActive = true
    }
    
    func searchBarView() {
        searchBar = BookSearch(frame: CGRect(x: 0, y: 0, width: 500, height: 20))
        searchBar.center = CGPoint(x: 0, y: 0)
        self.view.addSubview(self.searchBar)
    }
    
    
    func searchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -650).isActive = true
    }
    
    func toolBarSetup() {
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        done.tintColor = .white
        
        let items = NSMutableArray()
        items.addObjects(from: [flexSpace, done])
        
        doneToolbar.items = (items as! [UIBarButtonItem])
        doneToolbar.sizeToFit()
        
        self.searchBar.inputAccessoryView = doneToolbar
        
    }
    @objc func doneAction() {
        self.searchBar.resignFirstResponder()
    }
}

extension BrowseBooksScreen: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCell
        cell.imageData = self.imageData[indexPath.row]
        if let imageData = searchItems {
            let genre = imageData[indexPath.row]
            cell.imageData?.title = genre
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            filteredGenres = searchItems?.filter { genre in
                return genre.lowercased().contains(searchText.lowercased())
            }
            
        } else {
            filteredGenres = searchItems
        }
        collectionView.reloadData()
    }
}
