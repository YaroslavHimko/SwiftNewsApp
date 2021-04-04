//
//  NewsItemTableViewCell.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 28.03.21.
//

import UIKit
import SDWebImage

class NewsItemTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setNews(with newsItem: Article) {
        titleLabel.text = newsItem.title
        descriptionLabel.text = newsItem.description
        newsImage.sd_setImage(with: URL(string: newsItem.urlToImage ?? Constants.defaultImage))
    }
}
