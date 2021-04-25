//
//  SignUpViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit

class SignUpViewController: UIViewController {

    
//MARK:- Outlet
    private let titleLabel           = UILabel()
    
    private let idTextField          = UITextField()
    private let passwordTextField    = UITextField()
    private let checkTextField       = UITextField()
    private let signInButton         = UIButton()
    
    private let mainStackView        = UIStackView()
    
    
    
//MARK:- Action
    @objc
    func onClickSignInButton(_ sender: Any) {
        if idTextField.hasText , passwordTextField.hasText , checkTextField.hasText{
            let signInVC = SignInViewController()
            
            if let id = idTextField.text{
                signInVC.message = "\(id)님 \n가입이 완료되었습니다."
            }
            
            signInVC.modalPresentationStyle = .fullScreen
            self.present(signInVC, animated: true, completion: nil)
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
    
    @objc
    func checkTextFieldDidChange(_ textField : UITextField){
        changeStatus()
    }
    

//MARK:- View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        setAttribute()
        setFunction()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        [idTextField,passwordTextField,checkTextField].forEach { $0?.text = .none}
        changeStatus()
    }
    
    
//MARK:- Function
    func setFunction(){
        idTextField.addTarget(self, action: #selector(idTextFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        checkTextField.addTarget(self, action: #selector(checkTextFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        signInButton.addTarget(self, action: #selector(onClickSignInButton(_:)), for: .touchUpInside)
    }
    
    func changeStatus(){
        if idTextField.hasText , passwordTextField.hasText , checkTextField.hasText{
            signInButton.setBackgroundColor(.yellow500, for: .normal)
        }else{
            signInButton.setBackgroundColor(.gray100, for: .normal)
        }
    }
    
    
    func setLayout(){
        mainStackView.addArrangedSubviews(idTextField,passwordTextField,checkTextField,signInButton)
        view.addSubviews(titleLabel,mainStackView)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
        }
        
        mainStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(150)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        [idTextField,passwordTextField,checkTextField,signInButton].forEach {
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
            $0.text = "카카오톡을 시작합니다"
            $0.font = .font22
            $0.textColor = .black100
        }
        
        signInButton.then{
            $0.setTitle("새로운 카카오계정 만들기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .font15
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.gray100, for: .normal)
        }
        
        idTextField.then {
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("이메일 또는 전화번호",UIColor.gray500,UIFont.font18)
            $0.clearButtonMode = .whileEditing
        }
        
        passwordTextField.then {
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("비밀번호",UIColor.gray500,UIFont.font18)
            $0.isSecureTextEntry = true
            $0.clearButtonMode = .whileEditing
        }
        
        checkTextField.then {
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("비밀번호 확인", UIColor.gray500, UIFont.font18)
            $0.isSecureTextEntry = true
            $0.clearButtonMode = .whileEditing
        }
        
    }

}
