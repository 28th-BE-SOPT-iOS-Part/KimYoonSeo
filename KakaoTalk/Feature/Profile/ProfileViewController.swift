//
//  ProfileViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/11.
//

import UIKit
import SnapKit

class ProfileViewController: PannableViewController {
    
    private let closeButton = UIButton()
    private let profileImage = UIImageView()
    private let nameLabel = UILabel()
    private let dividerLine = UIView()
    
    private let buttonStackView = UIStackView()
    
    private let talkWithMeButton = UIButton()
    private let modifyProfileButton = UIButton()
    private let storyButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .profileBackground
        
        setFunc()
        setLayout()
        setAttributes()
    }
    
    
    @objc
    func onClickCloseButton(_: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    func setFunc(){
        closeButton.addTarget(self, action: #selector(onClickCloseButton), for: .touchUpInside)
    }
    
    func setLayout(){
        [talkWithMeButton,modifyProfileButton,storyButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        [closeButton,profileImage,nameLabel,dividerLine,buttonStackView].forEach {
            view.addSubview($0)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(49)
            $0.height.equalTo(52)
        }
        
        profileImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(202)
            $0.width.equalTo(97)
            $0.height.equalTo(96)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        dividerLine.snp.makeConstraints {
            $0.height.equalTo(0.7)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(nameLabel.snp.bottom).offset(42)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(44)
            $0.trailing.equalToSuperview().inset(44)
            $0.top.equalTo(dividerLine.snp.bottom).offset(11)
            $0.width.equalTo(buttonStackView.snp.height).multipliedBy(4)
            $0.width.height.equalToSuperview().priority(.high)
        }
    }
    
    func setAttributes(){
        closeButton.setImage(.profileCloseBtn, for: .normal)
        
        profileImage.image = .profileUserImg
        
        nameLabel.then{
            $0.text = "김윤서"
            $0.textColor = .white
            $0.font = .font18
        }
        
        dividerLine.backgroundColor = .gray100
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        storyButton.then{
            $0.setImage(.profileStoryImg, for: .normal)
            $0.setTitle("카카오스토리", for: .normal)
            $0.titleLabel?.font = .font10
            $0.alignTextBelow()
        }
        
        talkWithMeButton.then{
            $0.setImage(.profileTalkImg, for: .normal)
            $0.setTitle("나와의 채팅", for: .normal)
            $0.titleLabel?.font = .font10
            $0.alignTextBelow()
        }
        modifyProfileButton.then{
            $0.setImage(.profileEditImg, for: .normal)
            $0.setTitle("프로필 편집", for: .normal)
            $0.titleLabel?.font = .font10
            $0.alignTextBelow()
        }
        
        
    }
}
