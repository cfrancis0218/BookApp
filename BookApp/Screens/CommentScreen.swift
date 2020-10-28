//
//  CommentScreen.swift
//  BookApp
//
//  Created by Christian Elijah on 2020-10-08.
//

import UIKit

class CommentScreen: UIViewController {
    
    var commentField = CommentField()
    var post = PostButton()
    var commentView = CommentView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        commentSetup()
        toolBarSetup()
        postSetup()
        buttonSetup()
        textView()
    }
    
    func commentSetup() {
        commentField.center = CGPoint(x: 0, y: 0)
        commentField = CommentField(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        self.view.addSubview(commentField)
        
        commentField.translatesAutoresizingMaskIntoConstraints = false
        commentField.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        commentField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        commentField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        commentField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350).isActive = true
    }
    
    func postSetup() {
        self.post.center = CGPoint(x: 0, y: 0)
        self.post = PostButton(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        self.view.addSubview(self.post)
        
        post.translatesAutoresizingMaskIntoConstraints = false
        post.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        post.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        post.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        post.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
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
        
        self.commentField.inputAccessoryView = doneToolbar
        
    }
    @objc func doneAction() {
        self.commentField.resignFirstResponder()
    }
    
    func buttonSetup() {
        post.addTarget(self, action: #selector(makePost), for: .touchUpInside)
    }
    
    func textView() {
        self.commentView.center = CGPoint(x: 0, y: 0)
        self.commentView = CommentView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        self.view.addSubview(self.commentView)
        
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        commentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        commentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        commentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -480).isActive = true
    }
    
    @objc func makePost() {
        
        if commentField.text == "" {
            let alert = UIAlertController(title: "Required Space Empty", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else {
            commentView.text.append("Comment: \(commentField.text!)\n")
            commentField.clearsOnBeginEditing = true
        }
    }

}
