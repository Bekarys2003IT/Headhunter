//
//  LoginViewController.swift
//  Headhunter
//
//  Created by Bekarys Sandigali on 23.03.2024.
//

//
//  ViewController.swift
//  Headhunter
//
//  Created by Bekarys Sandigali on 22.03.2024.
//

import UIKit
import SnapKit
import Firebase
import MessageUI
class LoginViewController: UIViewController,UITextFieldDelegate, MFMailComposeViewControllerDelegate {

    let cabLabel:UILabel = {
       let label = UILabel()
        label.text = "Вход в личный кабинет"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    lazy var mainView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 34/255, green: 35/255, blue: 37/255, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()
    let searchLabel : UILabel = {
        let label = UILabel()
        label.text = "Поиск работы"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    public lazy var emailTextField :UITextField = {
       let email = UITextField()
        email.placeholder = "example@mail.ru"
        email.layer.cornerRadius = 8
        email.backgroundColor = .lightGray
        email.keyboardType = .emailAddress
        email.autocapitalizationType = .none
        email.autocorrectionType = .no
        email.isUserInteractionEnabled = true
        email.delegate = self
        return email
    }()
    lazy var checkLabel:UILabel = {
       let label = UILabel()
        label.text = "Incorrect email type"
        label.isHidden = true
        label.textColor = .white
        return label
    }()
    let nextButton:UIButton = {
       let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 43/255, green: 127/255, blue: 254/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(continueMain), for: .touchUpInside)
        return button
    }()
    let passwordButton:UIButton = {
        let button = UIButton()
        button.setTitle("Войти с паролем", for: .normal)
        button.setTitleColor(UIColor(red: 10/255, green: 153/255, blue: 255/255, alpha: 1), for: .normal)
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
        mainView.addSubview(emailTextField)
        mainView.addSubview(checkLabel)
        mainView.addSubview(nextButton)
        mainView.addSubview(passwordButton)
        
        //constraints
        cabLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().inset(30)
        }
        mainView.snp.makeConstraints { make in
            make.top.equalTo(cabLabel.snp.bottom).offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(390)
            make.height.equalTo(320)
            
        }
        searchLabel.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.top).offset(20)
            make.leading.equalTo(mainView.snp.leading).offset(30)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(330)
        }
        checkLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(35)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(70)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        passwordButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(80)
            make.leading.equalTo(nextButton.snp.trailing).offset(30)
        }
        
        
    }
    func sendVerificationEmail(){
        guard let email = emailTextField.text else { return }
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    if let error = error {
                        // Handle errors
                        print(error.localizedDescription)
                        return
                    }
                    // Email sent
                }
    }


}
extension LoginViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            if let email = textField.text, let errorMessage = invalidEmail(email) {
                print(errorMessage)
                checkLabel.text = errorMessage
                showCheckLabel(true)
            } else {
                showCheckLabel(false)
            }
        }
        return true
    }
    func invalidEmail(_ value: String) -> String? {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: value) {
            return "Invalid email address"
        }
        return nil
    }
    @objc func continueMain() {
        guard let email = emailTextField.text, invalidEmail(email) == nil else {
                checkLabel.text = "Invalid email address"
                showCheckLabel(true)
                return
            sendVerificationEmail()
            }
            
            // Hide the error message
            showCheckLabel(false)
            
            
            // Push to the code verification view controller
            let checkViewController = CheckViewController(emailText: email)
            navigationController?.pushViewController(checkViewController, animated: true)
        }
    

    
    
    func showCheckLabel(_ show:Bool){
        checkLabel.isHidden = !show
    }
}
