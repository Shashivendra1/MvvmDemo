//
//  nyrentalCollectionViewCell1.swift
//  PhotoApp_MVVM
//
//  Created by shashivendra  on 03/02/22.
//

import UIKit

class nyrentalCollectionViewCell1: UICollectionViewCell {
    
     let imageView = UIImageView()


     override init(frame: CGRect) {
         super.init(frame: frame)
         self.contentView.addSubview(imageView)
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleToFill
         imageView.layer.masksToBounds = true
         imageView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 0),imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor,multiplier: 0.95),imageView.heightAnchor.constraint(equalToConstant:180),imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)])
  
//         NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:  5),imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 0),imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor,constant: -10),imageView.heightAnchor.constraint(equalToConstant:180)])
     
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
}
