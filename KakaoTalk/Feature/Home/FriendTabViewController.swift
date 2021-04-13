//
//  ViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/10.
//

import UIKit
import SnapKit

class FriendTabViewController: UIViewController {

    private var firendLabel = UILabel()
    private var profileButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFunc()
        setLayout()
        setAttributes()
        
    }
    
    @objc
    func onClickProfileButton(_: UIButton) {
        let profileViewController = ProfileViewController()
        profileViewController.modalPresentationStyle = .overFullScreen
        self.present(profileViewController, animated: true)
    }
    
    private func setFunc(){
        profileButton.addTarget(self, action: #selector(onClickProfileButton), for: .touchUpInside)
    }
    
    private func setAttributes(){
        firendLabel.text = "친구"
        firendLabel.font = .font21Bold
        
        profileButton.setBackgroundImage(.profileUserImg, for: .normal)
    }
    
    private func setLayout(){
        view.addSubview(firendLabel)
        view.addSubview(profileButton)
        
        firendLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            $0.leading.equalToSuperview().offset(14)
        }
        
        profileButton.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.width.equalTo(59)
            $0.top.equalTo(firendLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(13)
        }
    }
  
}
