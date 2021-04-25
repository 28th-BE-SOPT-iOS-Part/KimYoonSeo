//
//  LoginViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
//MARK:- Outlet
    private let titleLabel           = UILabel()
    private let subTitleLabel        = UILabel()
    private let idTextField          = UITextField()
    private let passwordTextField    = UITextField()
    private let signInButton         = UIButton()
    private let signUpButton         = UIButton()
    
    private let mainStackView        = UIStackView()
    
//MARK:- Action
    @objc
    func onClickSignInButton(_ sender: Any) {
        if idTextField.hasText , passwordTextField.hasText {
           let signInVC = SignInViewController()
            
            if let id = idTextField.text{
                signInVC.message = "\(id)님 \n로그인 되었습니다."
            }
            
            signInVC.modalPresentationStyle = .fullScreen
            self.present(signInVC, animated: true, completion: nil)
        }
    }
    
    @objc
    func onClickSignUpButton(_ sender: Any) {
        if !idTextField.hasText , !passwordTextField.hasText {
            let signUpVC = SignUpViewController()
            self.navigationController?.pushViewController(signUpVC, animated: true)
        }
    }
    
    @objc
    func idTextFieldDidChange(_ textField : UITextField){
        changeStatus()
    }
    
    @objc
    func passwordTextFieldDidChange(_ textField : UITextField){
        changeStatus()
    }
    
//MARK:- View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFunction()
        setLayout()
        setAttribute()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        [idTextField,passwordTextField].forEach { $0?.text = ""}
        changeStatus()
    }
    

//MARK:- Function
    func changeStatus(){
        if idTextField.hasText , passwordTextField.hasText
        {
            signInButton.setBackgroundColor(.yellow500, for: .normal)
            signUpButton.setBackgroundColor(.gray100, for: .normal)
        }
        else if idTextField.hasText || passwordTextField.hasText
        {
            signInButton.setBackgroundColor(.gray100, for: .normal)
            signUpButton.setBackgroundColor(.gray100, for: .normal)
        }
        else
        {
            signInButton.setBackgroundColor(.gray100, for: .normal)
            signUpButton.setBackgroundColor(.yellow500, for: .normal)
        }
    }
    
    func setFunction(){
        idTextField.addTarget(self, action: #selector(idTextFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        signUpButton.addTarget(self, action: #selector(onClickSignUpButton(_:)), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(onClickSignInButton(_:)), for: .touchUpInside)
    }
    
    func setLayout(){
        mainStackView.addArrangedSubviews(idTextField,passwordTextField,signUpButton,signInButton)
        
        view.addSubviews(titleLabel,subTitleLabel,mainStackView)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        mainStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(70)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        [idTextField,passwordTextField,signInButton,signUpButton].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
        
    }
    
    func setAttribute(){
        
        mainStackView.then{
            $0.spacing = 30
            $0.axis = .vertical
            $0.distribution = .fillEqually
        }
        
        titleLabel.then{
            $0.text         = "카카오톡을 시작합니다"
            $0.font         = .font22
            $0.textColor    = .black100
        }
        
        subTitleLabel.then{
            $0.text         = "사용하던 카카오톡 계정이 있다면\n 이메일 또는 전화번호로 로그인해주세요."
            $0.font         = .font17
            $0.textColor    = .gray500
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
       
        
        signInButton.then{
            $0.setTitle("카카오계정 로그인", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .font15
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.gray100, for: .normal)
        }
        
        signUpButton.then{
            $0.setTitle("새로운 카카오계정 만들기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .font15
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.yellow500, for: .normal)
        }
        
        idTextField.then{
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("이메일 또는 전화번호",UIColor.gray500,UIFont.font18)
            $0.clearButtonMode = .whileEditing
            
        }
        
        passwordTextField.then{
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("비밀번호",UIColor.gray500,UIFont.font18)
            $0.isSecureTextEntry = true
            $0.clearButtonMode = .whileEditing
        }
    }
    
}
