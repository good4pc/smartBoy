//
//  SmartBoyFeed.swift
//  SmartBoy
//
//  Created by Prasanth pc on 2019-04-19.
//  Copyright © 2019 Prasanth pc. All rights reserved.
//

import UIKit
class SmartBoyFeed: UICollectionViewCell {
    fileprivate let identifier = "SmartBoyFeedCellIdentifier"
    override init(frame: CGRect) {
        super.init(frame: frame)
        // self.backgroundColor = UIColor.orange
        self.addSubview(collectionView)
        self.addSubview(navigationBar)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SmartBoyFeedCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.contentInsetAdjustmentBehavior = .never
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[V0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["V0":navigationBar]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[V0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["V0":collectionView]))
        navigationBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 64.0).isActive = true
        collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[navBar(48)][V0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["V0":collectionView,"navBar": navigationBar]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        return collectionView
    }()
    
    let navigationBar: UIView = {
        
        
        
        let view = UIView()
        //view.layer.addBorder(with: UIColor.black)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let naviationTitleView = UIImageView()
        naviationTitleView.image = UIImage(named: "title")
        naviationTitleView.translatesAutoresizingMaskIntoConstraints = false
        naviationTitleView.contentMode = .scaleAspectFill
        view.addSubview(naviationTitleView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[V0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["V0": naviationTitleView]))
        naviationTitleView.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        naviationTitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        naviationTitleView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
}

extension SmartBoyFeed: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SmartBoyFeedCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.self.width, height: 500)
    }
    
    
}

