//
//  SmartBoyViewController.swift
//  SmartBoy
//
//  Created by Prasanth pc on 2019-04-18.
//  Copyright © 2019 Prasanth pc. All rights reserved.
//

import UIKit
enum Section: Int{
    case cameraView = 0
    case feed = 1
    case chats = 2
}

class SmartBoyViewController: UIViewController {

    fileprivate let cellIdentifierForFeed = "collectionViewCellIdentifier"
    fileprivate let storiesCellIdentifier = "storiesCellIdentifier"
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.gray
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.addSubview(collectionView)
        collectionView.frame = self.view.frame
       
        collectionView.delegate = self
        collectionView.dataSource = self
       
        collectionView.register(SmartBoyFeed.self, forCellWithReuseIdentifier: cellIdentifierForFeed)
        collectionView.register(SmartBoyStoriesCell.self, forCellWithReuseIdentifier: storiesCellIdentifier)
       //
        
        //MARK : scroll to the first section
        collectionView.performBatchUpdates(nil) { (bool) in
            self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 1), at: .bottom, animated: true)
        }
    }

}

extension SmartBoyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case Section.cameraView.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierForFeed, for: indexPath)
            return cell
            
        case Section.feed.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierForFeed, for: indexPath) as! SmartBoyFeed
            return cell
            
        case Section.chats.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierForFeed, for: indexPath)
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierForFeed, for: indexPath)
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}

/*extension SmartBoyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
 */

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
