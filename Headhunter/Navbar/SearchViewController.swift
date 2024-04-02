//
//  SearchViewController.swift
//  Headhunter
//
//  Created by Bekarys Sandigali on 22.03.2024.
//

import UIKit
import SnapKit
class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let jobCards: [Card] = [
        Card(job: "Software Engineer", city: "New York", company: "Tech Corp", salary: "$100,000", jobExperience: "5 years", published: "2023-01-01", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase"))),
        Card(job: "Data Scientist", city: "San Francisco", company: "Data Insights", salary: "$120,000", jobExperience: "3 years", published: "2023-02-15", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase"))),
        Card(job: "Product Manager", city: "Seattle", company: "Innovate Startup", salary: nil, jobExperience: "2 years", published: "2023-03-10", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase"))),
        Card(job: "Graphic Designer", city: "Los Angeles", company: "Creative Studio", salary: "$80,000", jobExperience: "4 years", published: "2023-04-05", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase"))),
        Card(job: "Web Developer", city: "Chicago", company: "Web Solutions", salary: "$90,000", jobExperience: "3 years", published: "2023-05-20", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase"))),
        Card(job: "UX Designer", city: "Austin", company: "Design Innovate", salary: "$85,000", jobExperience: "2 years", published: "2023-06-12", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase"))),
        Card(job: "Marketing Manager", city: "Boston", company: "Market Leaders", salary: "$95,000", jobExperience: "6 years", published: "2023-07-04", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase"))),
        Card(job: "Business Analyst", city: "Miami", company: "BizAnalytics", salary: nil, jobExperience: "1 year", published: "2023-08-15", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase"))),
        Card(job: "HR Specialist", city: "Denver", company: "People First", salary: "$70,000", jobExperience: "4 years", published: "2023-09-01", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase"))),
        Card(job: "Project Manager", city: "Atlanta", company: "Projects Pro", salary: "$110,000", jobExperience: "7 years", published: "2023-10-10", isLiked: false,iconImage:  UIImageView(image: UIImage(systemName: "suitcase")))
    ]
    
    lazy var searchBar:UISearchBar = {
       let search = UISearchBar()
        search.placeholder = "Должность, ключевые слова"
        search.barTintColor = .lightGray
        search.layer.cornerRadius = 8
        return search
    }()
    let scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.bounces = true
        scroll.contentSize = CGSize(width: 600 , height: 120)
        return scroll
    }()
   
    lazy var view1:UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 34/255, green: 35/255, blue: 37/255, alpha: 1)
        return view
    }()
    let iconImage1:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.tintColor = .blue
        return imageView
    }()
    let label1:UILabel = {
       let label = UILabel()
        label.text = "Вакансии \nрядом с вами"
        label.font = .systemFont(ofSize: 14,weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    lazy var view2:UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 34/255, green: 35/255, blue: 37/255, alpha: 1)
        return view
    }()
    let iconImage2:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.tintColor = .blue
        return imageView
    }()
    let label2:UILabel = {
       let label = UILabel()
        label.text = "Поднять резюме \nв поиске"
        label.font = .systemFont(ofSize: 14,weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    lazy var label22:UILabel = {
        let label = UILabel()
        label.text = "Поднять"
        label.font = .systemFont(ofSize: 14,weight: .regular)
        label.textColor = UIColor(red: 76/255, green: 178/255, blue: 77/255, alpha: 1)
        return label
    }()
    lazy var view3:UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 34/255, green: 35/255, blue: 37/255, alpha: 1)
        return view
    }()
    let iconImage3:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "document")
        imageView.tintColor = .blue
        return imageView
    }()
    let label3:UILabel = {
       let label = UILabel()
        label.text = "Временная \nработа и\nподработка"
        label.font = .systemFont(ofSize: 14,weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    lazy var vacancyLabel:UILabel = {
        let label = UILabel()
        label.text = "Вакансии для вас"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    lazy var someTableView:UITableView = {
       let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .black
        table.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.showsHorizontalScrollIndicator = false
        setUI()
        setupViews()
        sometableViewScroll()
    }
    func setUI(){
        view.addSubview(searchBar)
        view.addSubview(scrollView)
        scrollView.addSubview(view1)
        scrollView.addSubview(view2)
        scrollView.addSubview(view3)
        view1.addSubview(iconImage1)
        view1.addSubview(label1)
        view2.addSubview(iconImage2)
        view2.addSubview(label2)
        view2.addSubview(label22)
        view3.addSubview(iconImage3)
        view3.addSubview(label3)
        view.addSubview(vacancyLabel)
        view.addSubview(someTableView)
        //constraint
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(30)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(120)
            make.width.equalTo(600)
            
        }
        iconImage1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(view1.snp.leading).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(iconImage1.snp.bottom).offset(10)
            make.leading.equalTo(view1.snp.leading).offset(15)
        }
        iconImage2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(view2.snp.leading).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(iconImage2.snp.bottom).offset(10)
            make.leading.equalTo(view2.snp.leading).offset(15)
        }
        label22.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom)
            make.leading.equalTo(view2.snp.leading).offset(15)
        }
        iconImage3.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(view3.snp.leading).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        label3.snp.makeConstraints { make in
            make.top.equalTo(iconImage3.snp.bottom).offset(10)
            make.leading.equalTo(view3.snp.leading).offset(15)
        }
        vacancyLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
        }
        someTableView.snp.makeConstraints { make in
            make.top.equalTo(vacancyLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }

    }
    func setupViews() {
        
        let views = [view1, view2, view3]
        let viewWidth: CGFloat = 150
        let viewHeight: CGFloat = 120
        let padding: CGFloat = 20
        
        var previousView: UIView?
        
        for view in views {
            scrollView.addSubview(view)
            view.layer.cornerRadius = 10
            view.clipsToBounds = true
            
            view.snp.makeConstraints { make in
                make.width.equalTo(viewWidth)
                make.height.equalTo(viewHeight)
                
                make.centerY.equalTo(scrollView.snp.centerY)
                
                if let previousView = previousView {
                    make.left.equalTo(previousView.snp.right).offset(padding)
                } else {
                    make.left.equalTo(scrollView.snp.left).offset(padding)
                }
            }
            previousView = view
        }
        
        // Ensure the last view's right is equal to the scrollView's right minus padding to define content width.
        if let lastView = views.last {
            lastView.snp.makeConstraints { make in
                make.right.equalTo(scrollView.snp.right).offset(-padding)
            }
        }
        
        // It's important to set a height for the scrollView itself, or else it will size itself to its content.
        scrollView.snp.makeConstraints { make in
            make.height.equalTo(viewHeight)
        }
        
    }
    func sometableViewScroll(){
        someTableView.rowHeight = UITableView.automaticDimension
        someTableView.estimatedRowHeight = 216
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobCards.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 216 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = someTableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        let jobCard = jobCards[indexPath.row]
        cell.jobLabel.text = jobCard.job
        cell.cityLabel.text = jobCard.city
        cell.companyLabel.text = jobCard.company
        cell.experienceLabel.text = jobCard.jobExperience
        cell.salaryLabel.text = jobCard.salary
        cell.isLiked = jobCard.isLiked
        cell.iconImage.image = jobCard.iconImage?.image
        cell.clickButtonAction = { [weak self] in
               guard let weakSelf = self else { return }
            DispatchQueue.main.async{
                let notificationView = NotificationView(frame: weakSelf.view.frame)
                weakSelf.view.addSubview(notificationView)
                
                // Set constraints for notificationView if you are using SnapKit or Auto Layout
                notificationView.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }
           }
        return cell
    }
}
