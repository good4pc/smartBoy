//
//  SmartBoyViewController.swift
//  SmartBoy
//
//  Created by Prasanth pc on 2019-04-18.
//  Copyright © 2019 Prasanth pc. All rights reserved.
//

import UIKit
enum Section: Int{
    case stories =  0
    case feed = 1
}

class SmartBoyViewController: UIViewController {

    fileprivate let cellIdentifier = "collectionViewCellIdentifier"
    fileprivate let storiesCellIdentifier = "storiesCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.view.addSubview(collectionView)
        collectionView.frame = self.view.frame
        collectionView.backgroundColor = UIColor.gray
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SmartBoyCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(SmartBoyStoriesCell.self, forCellWithReuseIdentifier: storiesCellIdentifier)
    }

}

extension SmartBoyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == Section.stories.rawValue {
            return 1
        }
        else {
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case Section.stories.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storiesCellIdentifier, for: indexPath)
            return cell
        case Section.feed.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case Section.stories.rawValue:
            return CGSize(width: self.view.frame.width, height: 70)
        case Section.feed.rawValue:
           return CGSize(width: self.view.frame.width, height: 100)
        default:
            return CGSize(width: self.view.frame.width, height: 100)
        }
       
    }
}

class SmartBoyCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SmartBoyStoriesCellItems: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SmartBoyStoriesCell: UICollectionViewCell {
    fileprivate let storiesCellIdentifier = "storiesCollectionViewCell"
    let collectionView: UICollectionView = {
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.addSubview(collectionView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[V0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["V0":collectionView]))
          self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[V0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["V0":collectionView]))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SmartBoyStoriesCellItems.self, forCellWithReuseIdentifier: storiesCellIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SmartBoyStoriesCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
            return 10
      
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storiesCellIdentifier, for: indexPath) as! SmartBoyStoriesCellItems
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 50, height: 50)
  
    }
}
