//
//  SmartBoyFeedCell.swift
//  SmartBoy
//
//  Created by Prasanth pc on 2019-04-19.
//  Copyright © 2019 Prasanth pc. All rights reserved.
//

import UIKit

fileprivate enum SectionHeight: CGFloat {
    case section1 = 50.0
    case section3 = 70.001
    case section4 = 100.0
}

class SmartBoyFeedCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Divide cell intp 4 sections now.
        //1.topHeader with user details
        //2.content view aka image or video
        //3.like , pager
        //4.comments section
        
        //section 1:
        
        self.addSubview(section1)
        self.addSubview(section2)
        self.addSubview(section3)
        self.addSubview(section4)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[section1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["section1":section1]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[section1(\(SectionHeight.section1.rawValue))][section2][section3(\(SectionHeight.section3.rawValue))][section4(\(SectionHeight.section4.rawValue))]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["section1":section1,
                                                                                                                                                                                                                                                                                                            "section2":section2,"section4":section4,
                                                                                                                                                                                                                                                                                                            "section3":section3]))
        
        
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[section2]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["section2":section2]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[section3]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["section3":section3]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[section4]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["section4":section4]))
        
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: [
//                                                                                                                                                                                                                                    ]))
        
        section3.addUnderLine()
        section4.addUnderLine()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Section 1
    
    let section1: UIView = {
        
        let profileThumbnail: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "thumbNail")
            image.translatesAutoresizingMaskIntoConstraints = false
            image.layer.cornerRadius = 15.0
           // image.layer.borderWidth = 1.0
          //  image.layer.borderColor = UIColor.darkGray.cgColor
            image.layer.masksToBounds = true
            return image
        }()
        
        let userName: UILabel = {
            let name = UILabel()
            name.translatesAutoresizingMaskIntoConstraints = false
            name.text = "Good4pc"
            name.textColor = UIColor.lightGray
            return name
        }()
        
        let view = UIView()
       // view.layer.addBorder(with: UIColor.brown)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        //profile thumbnail
        
        view.addSubview(profileThumbnail)
        view.addSubview(userName)
        userName.font = UIFont.boldSystemFont(ofSize: 12.0)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[thumbNail(30)]-10-[username]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["thumbNail":profileThumbnail,"username":userName]))
        userName.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        userName.centerYAnchor.constraint(equalTo: profileThumbnail.centerYAnchor).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[thumbNail(30)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["thumbNail":profileThumbnail]))
        return view
        
        
    }()
    
    //MARK: - Section 2

    
    let section2: UIView = {
        let feedImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "vishu")
           // image.translatesAutoresizingMaskIntoConstraints = false
           //image.layer.cornerRadius = 15.0
           // image.layer.borderWidth = 1.0
           // image.layer.borderColor = UIColor.darkGray.cgColor
           image.layer.masksToBounds = true
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.orange
        
        view.addSubview(feedImage)
        feedImage.contentMode = .scaleAspectFill
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[feedImage]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["feedImage":feedImage]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[feedImage]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["feedImage":feedImage]))
        return view
    }()
    
    
    
    
    //MARK: - Section 3

    let section3: UIView = {
        
        
        let view = UIView()
       //view.layer.addBorder(with: UIColor.green)
        view.translatesAutoresizingMaskIntoConstraints = false
        //MARK:  * Like Button
        
        //Like button
        let likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(UIImage(named: "like"), for: .normal)
        view.addSubview(likeButton)
        
        //MARK:  Likes label
        
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.textColor = UIColor.lightGray
        likes.text = "1005 likes"
        likes.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(likes)
        
        //MARK: * Description
        
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "Happy Vishu everyone"
        description.textColor = .gray
        description.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(description)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[V0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["V0": description]))

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[likes(150)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["likes":likes]))
        
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[likeButton(30)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["likeButton":likeButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[likeButton(30)][likes][description]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["likeButton":likeButton,"likes":likes,"description":description]))
        return view
    }()
    
    //MARK: - Section 4
    
    let section4: UIView = {
        let view = UIView()
        //view.layer.addBorder(with: UIColor.black)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let chats = UILabel()
        chats.translatesAutoresizingMaskIntoConstraints = false
        chats.textColor = UIColor.lightGray
        chats.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sollicitudin lacus at erat posuere, vitae volutpat dolor porttitor. Integer vehicula dolor massa, ac auctor augue tristique eget. Aenean et fermentum magna, congue convallis arcu. Pellentesque urna felis, aliquam ut mollis et, tincidunt congue nisl. In malesuada elit ut tortor vestibulum elementum. Nulla leo odio, semper nec magna a, hendrerit luctus augue. Nulla eget pretium quam."
        chats.numberOfLines = 0
        chats.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(chats)
        
          view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[V0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["V0": chats]))
          view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[V0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["V0": chats]))
        return view
    }()
    
}

