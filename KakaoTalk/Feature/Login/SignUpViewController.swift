//
//  SignUpViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit

class SignUpViewController: UIViewController {

    
//MARK:- Outlet
    @IBOutlet weak var titleLabel           : UILabel!
    @IBOutlet weak var idTextField          : UITextField!
    @IBOutlet weak var passwordTextField    : UITextField!
    @IBOutlet weak var checkTextField       : UITextField!
    @IBOutlet weak var signInButton         : UIButton!
    
    
//MARK:- Action
    @IBAction func onClickSignInButton(_ sender: Any) {
        if idTextField.hasText , passwordTextField.hasText , checkTextField.hasText{
            guard let signInVC = storyboard?.instantiateViewController(identifier: "SignInViewController") as? SignInViewController else {return}
            
            if let id = idTextField.text{
                signInVC.message = "\(id)님 \n가입이 완료되었습니다."
            }
            
            signInVC.modalPresentationStyle = .fullScreen
            self.present(signInVC, animated: false, completion: nil)
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
    }
    
    func changeStatus(){
        if idTextField.hasText , passwordTextField.hasText , checkTextField.hasText{
            signInButton.setBackgroundColor(.yellow500, for: .normal)
        }else{
            signInButton.setBackgroundColor(.gray100, for: .normal)
        }
    }
    
    func setAttribute(){
        
        titleLabel.then{
            $0.text = "카카오톡을 시작합니다"
            $0.font = .font22
            $0.textColor = .black100
        }
        
        signInButton.then{
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.gray100, for: .normal)
        }
        
        idTextField.then {
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("이메일 또는 전화번호",UIColor.gray500,UIFont.font18)
        }
        
        passwordTextField.then {
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("비밀번호",UIColor.gray500,UIFont.font18)
            $0.isSecureTextEntry = true
        }
        
        checkTextField.then {
            $0.font = .font18
            $0.setBottomBorder()
            $0.setPlaceHolder("비밀번호 확인", UIColor.gray500, UIFont.font18)
            $0.isSecureTextEntry = true
        }
        
    }

}
