//
//  SearchTableViewCell.swift
//  Headhunter
//
//  Created by Bekarys Sandigali on 27.03.2024.
//

import UIKit


class SearchTableViewCell: UITableViewCell {
    var isLiked: Bool = false {
           didSet {
               likeButton.isSelected = isLiked
           }
       }
    var clickButtonAction:(() -> Void)?
    // MARK: - Properties
    let cardView:UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 34/255, green: 35/255, blue: 37/255, alpha: 1)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    lazy var jobLabel:UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        return label
    }()
    lazy var cityLabel:UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    lazy var salaryLabel:UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    lazy var companyLabel:UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    lazy var iconImage:UIImageView = {
       let imageView = UIImageView()
        imageView.tintColor = .white
        return imageView
    }()
    lazy var experienceLabel:UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    lazy var likeButton:UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.tintColor = .blue
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    lazy var clickButton:UIButton = {
       let click = UIButton()
        click.setTitle("Откликнуться", for: .normal)
        click.setTitleColor(.white, for: .normal)
        click.titleLabel?.font = .systemFont(ofSize: 12)
        click.backgroundColor = UIColor(red: 102/255, green: 178/255, blue: 76/255, alpha: 1)
        click.addTarget(self, action: #selector(clickButtonTapped), for: .touchUpInside)
        click.layer.cornerRadius = 16
        return click
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        contentView.backgroundColor = .black
    }
    func setUI(){
        contentView.addSubview(cardView)
        cardView.addSubview(likeButton)
        cardView.addSubview(jobLabel)
        cardView.addSubview(cityLabel)
        cardView.addSubview(salaryLabel)
        cardView.addSubview(companyLabel)
        cardView.addSubview(experienceLabel)
        cardView.addSubview(iconImage)
        cardView.addSubview(clickButton)
        
        //constraint
        cardView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.width.equalTo(350)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
        }
        likeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.width.equalTo(30)
            
        }
        jobLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
        }
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(jobLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        salaryLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
        }
        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(salaryLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
        }
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        experienceLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(10)
            make.leading.equalTo(iconImage.snp.trailing).offset(5)
        }
        clickButton.snp.makeConstraints { make in
            make.bottom.equalTo(cardView.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(300)
        }
        
    }

    @objc func likeButtonTapped(){
        isLiked.toggle()
    }
    @objc func clickButtonTapped(){
        print("Click is tapped")
        clickButtonAction?()
    
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
