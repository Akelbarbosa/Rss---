//
//  NewsTableViewCell.swift
//  Rss Noticias
//
//  Created by Akel Barbosa on 30/06/22.
//

import UIKit
import SDWebImage
class NewsCell: UICollectionViewCell {
    
    var News:News?
    
    private let imageOfNews: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.backgroundColor = .orange
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let titleNews: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.baselineAdjustment = .alignCenters
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let discriptionNews: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    func setup() {
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor(named: "ligthGray")?.cgColor
        
        
    }
   
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
   
        contentView.addSubview(titleNews)
        contentView.addSubview(discriptionNews)
        contentView.addSubview(imageOfNews)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleNews.frame = CGRect(x: 3, y: 0, width: 250, height: 90)
        discriptionNews.frame = CGRect(x: 3, y: 90, width: 250, height: 60)
        imageOfNews.frame = CGRect(x: 259, y: 0, width: 385 - 259, height: 150)
       
    }
    
    func titleForCell(news: News) {
        titleNews.text = news.title
        discriptionNews.text = news.description
        let imageNoFound = "https://i0.wp.com/elfutbolito.mx/wp-content/uploads/2019/04/image-not-found.png?ssl=1"
        guard let url = URL(string: news.urlToImage ?? imageNoFound) else {return}
        imageOfNews.sd_setImage(with: url, completed: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
