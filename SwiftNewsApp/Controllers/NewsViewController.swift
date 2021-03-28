//
//  ViewController.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 28.03.21.
//

import UIKit

class NewsViewController: UITableViewController {
    
    let newsArray: [NewsModel] = [NewsModel(title: "First", description: "Description", imageURL: "Image"),
                                  NewsModel(title: "Secord", description: "Description", imageURL: "Image"),
                                  NewsModel(title: "Third", description: "Description", imageURL: "Image"),
                                  NewsModel(title: "Fourth", description: "Description", imageURL: "Image")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.delegate = self
    }
    
    //MARK: - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsItem = newsArray[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsItemTableViewCell") as! NewsItemTableViewCell
        
        cell.setNews(newsItem: newsItem)

        return cell
    }
}

