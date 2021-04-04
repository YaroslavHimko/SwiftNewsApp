//
//  ViewController.swift
//  SwiftNewsApp
//
//  Created by Yaroslav Himko on 28.03.21.
//

import UIKit
import RxSwift
import SDWebImage

final class NewsViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    private let newsViewModel = NewsViewModel()
    private var newsArray: [Article] = []
    private var pullControl = UIRefreshControl()
    var filteredNews: [Article] = []
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews()
        registerPullToRefresh()
        registerSearch()
        
        tableView.delegate = self
    }
    
    private func loadNews() {
        newsViewModel.fetchNews()
            .subscribe(onSuccess: { response in
                self.newsArray = response.articles
                self.tableView.reloadData()
            }, onError: { (error) in
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    @objc private func refreshListData(_ sender: Any) {
        loadNews()
        self.pullControl.endRefreshing()
    }
    
    private func registerPullToRefresh() {
        pullControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        pullControl.addTarget(self, action: #selector(refreshListData(_:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = pullControl
        } else {
            tableView.addSubview(pullControl)
        }
    }
    
    private func registerSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search News"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredNews = newsArray.filter { (article: Article) -> Bool in
            return article.title!.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    //MARK: - TableView Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredNews.count
        }
        
        return newsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsItemTableViewCell", for: indexPath) as! NewsItemTableViewCell
        let article: Article
        if isFiltering {
            article = filteredNews[indexPath.row]
        } else {
            article = newsArray[indexPath.row]
        }
        
        cell.setNews(with: article)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article: Article
        if isFiltering {
            article = filteredNews[indexPath.row]
        } else {
            article = newsArray[indexPath.row]
        }
        
        guard let url = URL(string: article.url) else { return }
        UIApplication.shared.open(url)
    }
}

extension NewsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
