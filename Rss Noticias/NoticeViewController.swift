//
//  NoticeViewController.swift
//  Rss Noticias
//
//  Created by Akel Barbosa on 29/06/22.
//

import UIKit

 

class NoticeViewController: UIViewController {
    
    var News: News?
    
    private let stackPhotoNews: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .systemBackground
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let imageFromNews: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleNews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    
    private let contentNews: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textNews: UITextView = {
       let text = UITextView()
        text.isScrollEnabled = true
        text.backgroundColor = .systemBackground
        text.font = .systemFont(ofSize: 18)
        text.textAlignment = .justified
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .systemBackground
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "News"

        titleNews.text = News?.title!
        contentNews.text = News?.content!
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackPhotoNews)
        stackPhotoNews.addArrangedSubview(imageFromNews)

        scrollView.addSubview(titleNews)
        scrollView.addSubview(contentNews)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            

            stackPhotoNews.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackPhotoNews.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 6),
            stackPhotoNews.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 3),
            stackPhotoNews.heightAnchor.constraint(equalToConstant: view.frame.height / 4),
            stackPhotoNews.widthAnchor.constraint(equalToConstant: view.frame.width),
            imageFromNews.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            titleNews.topAnchor.constraint(equalTo: stackPhotoNews.bottomAnchor),
            titleNews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -3),
            titleNews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3),

            contentNews.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 5),
            contentNews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contentNews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            contentNews.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),


        ])
    }
}
