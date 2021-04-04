//
//  LoginViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit

class LoginViewController: UIViewController {
    
//MARK:- Outlet
    @IBOutlet weak var titleLabel           : UILabel!
    @IBOutlet weak var subTitleLabel        : UILabel!
    @IBOutlet weak var idTextField          : UITextField!
    @IBOutlet weak var passwordTextField    : UITextField!
    @IBOutlet weak var signInButton         : UIButton!
    @IBOutlet weak var signUpButton         : UIButton!
    
//MARK:- Action
    @IBAction func onClickSignInButton(_ sender: Any) {
        if idTextField.hasText , passwordTextField.hasText {
            guard let signInVC = storyboard?.instantiateViewController(identifier: "SignInViewController") as? SignInViewController else {return}
            
            if let id = idTextField.text{
                signInVC.message = "\(id)님 \n로그인 되었습니다."
            }
            
            signInVC.modalPresentationStyle = .fullScreen
            self.present(signInVC, animated: false, completion: nil)
        }
    }
    
    @IBAction func onClickSignUpButton(_ sender: Any) {
        if !idTextField.hasText , !passwordTextField.hasText {
            guard let signUpVC = storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else {return}
            self.navigationController?.pushViewController(signUpVC, animated: false)
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
        setAttribute()
        setFunction()
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
    }
    
    func setAttribute(){
        
        titleLabel.then{
            $0.text         = "카카오톡을 시작합니다"
            $0.font         = .font22
            $0.textColor    = .black100
        }
        
        subTitleLabel.then{
            $0.text         = "사용하던 카카오톡 계정이 있다면\n 이메일 또는 전화번호로 로그인해주세요."
            $0.font         = .font17
            $0.textColor    = .gray500
        }
       
        
        signInButton.then{
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.gray100, for: .normal)
        }
        
        signUpButton.then{
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.yellow500, for: .normal)
        }
        
        idTextField.then{
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("이메일 또는 전화번호",UIColor.gray500,UIFont.font18)
            
        }
        
        passwordTextField.then{
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("비밀번호",UIColor.gray500,UIFont.font18)
            $0.isSecureTextEntry = true
        }
    }
    
}
