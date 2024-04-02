//
//  ViewController.swift
//  Headhunter
//
//  Created by Bekarys Sandigali on 22.03.2024.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    let cabLabel:UILabel = {
       let label = UILabel()
        label.text = "Вход в личный кабинет"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    lazy var mainView:UIView = {
        let view = UIView()
        return view
    }()
    let searchLabel : UILabel = {
        let label = UILabel()
        label.text = "Поиск работы"
        label.textColor = UIColor(red: 10/255, green: 153/255, blue: 255/255, alpha: 1)
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    let emailLabel:UILabel = {
       let label = UILabel()
        label.text = "Электронная почта или телефон"
        label.textColor = UIColor(red: 10/255, green: 153/255, blue: 255/255, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    let iconImageView:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "envelope")
        icon.tintColor = UIColor(red: 10/255, green: 153/255, blue: 255/255, alpha: 1)
        return icon
    }()
    let nextButton:UIButton = {
       let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(UIColor(red: 10/255, green: 153/255, blue: 255/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(continueMain), for: .touchUpInside)
        return button
    }()
    let passwordButton:UIButton = {
        let button = UIButton()
        button.setTitle("Войти с паролем", for: .normal)
        button.setTitleColor(UIColor(red: 10/255, green: 153/255, blue: 255/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(continueMain), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
    func setUI(){
        view.addSubview(cabLabel)
        view.addSubview(mainView)
        mainView.addSubview(searchLabel)
        mainView.addSubview(emailLabel)
        mainView.addSubview(iconImageView)
        mainView.addSubview(nextButton)
        mainView.addSubview(passwordButton)
        
        //constraints
        cabLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().inset(30)
        }
        mainView.snp.makeConstraints { make in
            make.top.equalTo(cabLabel.snp.bottom).offset(150)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalToSuperview()
        }
        searchLabel.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.top).offset(20)
            make.leading.equalTo(mainView.snp.leading).offset(30)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(90)
        }
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
        }
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(70)
            make.leading.equalToSuperview().offset(50)
        }
        passwordButton.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(70)
            make.leading.equalTo(nextButton.snp.trailing).offset(50)
        }
        
        
    }
    @objc func continueMain(){
        print("tapped")
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }


}

