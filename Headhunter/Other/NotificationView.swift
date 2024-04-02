//
//  NotificationView.swift
//  Headhunter
//
//  Created by Bekarys Sandigali on 27.03.2024.
//

import UIKit
import RealmSwift
class NotificationView: UIView {
    private let resumeLabel:UILabel = {
       let label = UILabel()
        label.text = "Резюме для отклика"
        label.font = .systemFont(ofSize: 16,weight: .regular)
        label.textColor = .lightGray
        return label
    }()
     lazy var iconImageView:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "ellipse")
        return icon
    }()
    lazy var professionLabel:UILabel = {
       let label = UILabel()
        label.text = "UI/UX Designer"
        label.font = .systemFont(ofSize: 16,weight: .heavy)
        label.textColor = .white
        return label
    }()
    let dividerView:UIView = {
        let divider = UIView()
        divider.backgroundColor = .lightGray
        return divider
    }()
    lazy var coverLetterButton:UIButton = {
       let button = UIButton()
        button.setTitle("Добавить сопроводительное", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.backgroundColor = .clear
        return button
    }()
    lazy var clickButton:UIButton = {
       let button = UIButton()
        button.setTitle("Отклинуться", for: .normal)
        button.backgroundColor = UIColor(red: 76/255, green: 178/255, blue: 77/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16,weight: .regular)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9)
        setUI()
    }
    func setUI(){
        addSubview(resumeLabel)
        addSubview(iconImageView)
        addSubview(professionLabel)
        addSubview(dividerView)
        addSubview(coverLetterButton)
        addSubview(clickButton)
        
        //constraint
        resumeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(530)
            make.leading.equalToSuperview().offset(90)
        }
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(530)
            make.trailing.equalTo(resumeLabel.snp.leading).offset(-20)
            make.height.width.equalTo(50)
        }
        professionLabel.snp.makeConstraints { make in
            make.top.equalTo(resumeLabel.snp.bottom).offset(15)
            make.leading.equalTo(90)
        }
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(professionLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalTo(350)
        }
        coverLetterButton.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            
        }
        clickButton.snp.makeConstraints { make in
            make.top.equalTo(coverLetterButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(350)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
