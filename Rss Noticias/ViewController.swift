//
//  ViewController.swift
//  Rss Noticias
//
//  Created by Akel Barbosa on 29/06/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    var newsRecient: [News] = []
    
    private let tableNotices: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 385, height: 150)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
        
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .green
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Noticias recientes"
        
        APICaller.shared.getNews { result in
            switch result {
                case .success(let news):
                self.newsRecient = news
                DispatchQueue.main.async {
                    self.tableNotices.reloadData()

                }
                
                case .failure(let error):
                    print(error)
            }
        
        }
        

        tableNotices.dataSource = self
        tableNotices.delegate = self
        tableNotices.register(NewsCell.self, forCellWithReuseIdentifier: "NewsCell")
        

        view.addSubview(tableNotices)
        
        NSLayoutConstraint.activate([
      
            tableNotices.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableNotices.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            tableNotices.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableNotices.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    
        
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return newsRecient.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCell
        if newsRecient[indexPath.row].title != nil {
            cell.titleForCell(news: newsRecient[indexPath.row])
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let url = URL(string: newsRecient[indexPath.row].url ?? " ") else {return}
        let urlNews = SFSafariViewController(url: url)
        present(urlNews, animated: true)
        


    }
}

