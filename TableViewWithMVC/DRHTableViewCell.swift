//
//  DRHTableViewCell.swift
//  TableViewWithMVC
//
//  Created by Iavor Dekov on 10/15/16.
//  Copyright © 2016 Iavor Dekov. All rights reserved.
//

import UIKit

class DRHTableViewCell: UITableViewCell {

    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel?
    @IBOutlet weak var postDateLabel: UILabel?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var previewLabel: UILabel?
    
    func configureWithItem(item: DRHTableViewDataModelItem) {
        
        // setImageWithURL(url: item.avatarImageURL)
        authorNameLabel?.text = item.authorName
        postDateLabel?.text = item.date
        titleLabel?.text = item.title
        previewLabel?.text = item.previewText
        
    }
}
