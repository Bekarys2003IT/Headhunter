//
//  CheckViewController.swift
//  Headhunter
//
//  Created by Bekarys Sandigali on 23.03.2024.
//

import UIKit

class CheckViewController: UIViewController {

    var emailText:String? = ""
    init(emailText: String? = nil) {
        self.emailText = emailText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var codeLabel:UILabel = {
        let label = UILabel()
        label.text = "Отправили код на \(String(describing: emailText))"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    lazy var justLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.text = "Напишите его, чтобы подтвердить,\nчто это вы, а не кто-то другой входит \nв личный кабинет"
        label.numberOfLines = 0
        return label
    }()
    lazy var codeTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Код"
            textField.backgroundColor = .lightGray
            textField.layer.cornerRadius = 8
            textField.textAlignment = .center
            textField.keyboardType = .numberPad
            return textField
        }()
    lazy var confirmButton: UIButton = {
            let button = UIButton()
            button.setTitle("Подтвердить", for: .normal)
            button.backgroundColor = UIColor(red: 43/255, green: 127/255, blue: 254/255, alpha: 1)
            button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
            return button
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        justLabel.numberOfLines = 0
        setUI()
        
    }
    func setUI(){
        view.addSubview(codeLabel)
        view.addSubview(justLabel)
        view.addSubview(codeTextField)
        view.addSubview(confirmButton)
        
        codeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(120)
            make.centerX.equalToSuperview()
        }
        justLabel.snp.makeConstraints { make in
            make.top.equalTo(codeLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        codeTextField.snp.makeConstraints { make in
                    make.top.equalTo(justLabel.snp.bottom).offset(40)
                    make.leading.trailing.equalToSuperview().inset(50)
                    make.height.equalTo(50)
            }
                
                confirmButton.snp.makeConstraints { make in
                    make.top.equalTo(codeTextField.snp.bottom).offset(20)
                    make.leading.trailing.equalToSuperview().inset(50)
                    make.height.equalTo(50)
                }
        
    }
    @objc func confirmButtonTapped(){
        let isCodeCorrect = checkCode(codeTextField.text)
        if isCodeCorrect {
            if let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController {
                navigationController?.pushViewController(tabBarController, animated: true)
                }
        } else {
            let alert = UIAlertController(title: "Error", message: "Incorrect code", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true,completion: nil)
        }
    }
    func checkCode(_ code: String?) -> Bool {
       
        return code == "123456" // Assuming "123456" is the correct code
    }
    

}
