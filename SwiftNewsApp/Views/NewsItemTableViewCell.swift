//
//  NewsItemTableViewCell.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 28.03.21.
//

import UIKit

class NewsItemTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setNews(newsItem: NewsModel) {
        titleLabel.text = newsItem.title
        descriptionLabel.text = newsItem.description
    }
}
