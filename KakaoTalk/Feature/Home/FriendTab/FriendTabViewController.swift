//
//  ViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/10.
//

import UIKit
import SnapKit

protocol ProfileLoadDelegator{
    func setProfile(data : FriendDataModel)
}


class FriendTabViewController: UIViewController {

    private let friendLabel     = UILabel()
    private let topBarView      = UIView()
    private let settingButton   = UIButton()
    
    private let friendTableView = UITableView()
    
    private var friendList      : [FriendDataModel] = []
    private let yoonseoProfile = FriendDataModel(image: .profileUserImg, name: "기뮨서", state: "우헤헤")
    
    var delegate : ProfileLoadDelegator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        
        setFunc()
        setLayout()
        setAttributes()
        
    }
    
    @objc func onClickSettingButton(){
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: "편집", style: .default, handler: {

            (alert: UIAlertAction!) -> Void in

        })

        let managementAction = UIAlertAction(title: "친구 관리", style: .default, handler: {

            (alert: UIAlertAction!) -> Void in

        })


        let settinglAction = UIAlertAction(title: "전체 설정", style: .default, handler: {

            (alert: UIAlertAction!) -> Void in

        })

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {

            (alert: UIAlertAction!) -> Void in

        })
        
        optionMenu.pruneNegativeWidthConstraints()

        optionMenu.addAction(editAction)
        optionMenu.addAction(managementAction)
        optionMenu.addAction(settinglAction)
        optionMenu.addAction(cancelAction)

        self.present(optionMenu, animated: true, completion: nil)

    }
    
    private func setFunc(){
        settingButton.addTarget(self, action: #selector(onClickSettingButton), for: .touchUpInside)
    }
    
    private func setTableView(){
        setFriendList()
        friendTableView.dataSource = self
        friendTableView.delegate = self
        friendTableView.register(MyProfileTableViewCell.self,
                                      forCellReuseIdentifier: MyProfileTableViewCell.identifier)
        friendTableView.register(FriendTableViewCell.self,
                                      forCellReuseIdentifier: FriendTableViewCell.identifier)
        friendTableView.separatorStyle = .none
    }
    
    private func setAttributes(){
        
        friendLabel.text = "친구"
        friendLabel.font = .font22Bold
        
        settingButton.setBackgroundImage(.settingIcon, for: .normal)
    }
    
    private func setLayout(){
        view.addSubviews(topBarView,friendLabel,settingButton,friendTableView)
        
        topBarView.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        friendLabel.snp.makeConstraints {
            $0.centerY.equalTo(topBarView)
            $0.leading.equalTo(topBarView.snp.leading).offset(14)
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalTo(topBarView)
            $0.trailing.equalTo(topBarView.snp.trailing).inset(15)
        }
        
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    func setFriendList()
        {
            friendList.append(contentsOf: [
                FriendDataModel(image: .profileImage1,
                                name: "이택조",
                                state: "- 李택조배상 -"),
                
                FriendDataModel(image: .profileImage2,
                                name: "카페사장 최준",
                                state: "어? 예쁘다"),
                
                FriendDataModel(image: .zzangIcon,
                                name: "사과농장주",
                                state: "kill smile"),
                
                FriendDataModel(image: .profileImage4,
                                name: "쿨제이",
                                state: "필굿이야??!! 필!!!!!굿!!!!"),
                
                FriendDataModel(image: .profileImage5,
                                name: "광용쌤",
                                state: "그,,,,주식은,,,말이다,,,"),
                
                FriendDataModel(image: .profileImage6,
                                name: "영남회장",
                                state: "아 열쩡있게!"),
                
                FriendDataModel(image: .profileImage7,
                                name: "이호창",
                                state: "김갑생할머니김"),
                
                FriendDataModel(image: .profileImage8,
                                name: "예지언니🐙",
                                state: "사진 맛집 포토부스><"),
                
                FriendDataModel(image: .profileImage9,
                                name: "정재혁",
                                state: "어 민수ㅇㅑ 왔니 ..?"),
                
                FriendDataModel(image: .profileImage3,
                                name: "임플란티드 키드💕",
                                state: "누나 눼가 솨랑하뉘까아")
                
            ])
        }
}


extension FriendTabViewController : UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 73
        default :
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileViewController = ProfileViewController()
        profileViewController.modalPresentationStyle = .overFullScreen
        delegate = profileViewController
        
        switch indexPath.section {
        case 0 :
            delegate?.setProfile(data: yoonseoProfile)
        default :
            delegate?.setProfile(data: friendList[indexPath.row])
        }
        self.present(profileViewController, animated: true)
    }
}

extension FriendTabViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        default :
            return friendList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch indexPath.section {
        case 0 :
            if let cell = friendTableView.dequeueReusableCell(withIdentifier: MyProfileTableViewCell.identifier,for: indexPath) as? MyProfileTableViewCell {
                cell.setData(profile: yoonseoProfile)
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        default :
            if let cell = friendTableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier,for: indexPath) as? FriendTableViewCell {
                cell.setData(profile: friendList[indexPath.row])
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {


        let hideAction = UIContextualAction(style: .normal, title: "숨김", handler: { (action, view, success) in
         })
        
        let banAction = UIContextualAction(style: .normal, title: "차단", handler: { (action, view, success) in

         })
        
        hideAction.backgroundColor = .gray
        banAction.backgroundColor = .red500
        
        let configuration = UISwipeActionsConfiguration(actions: [banAction,hideAction])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
   }
    
    func tableView(_ tableView: UITableView,
                            contextMenuConfigurationForRowAt indexPath: IndexPath,
                            point: CGPoint) -> UIContextMenuConfiguration? {
        
        
        let chatAction      = UIAction(title:"채팅하기") { action in }
        let voiceAction     = UIAction(title:"보이스톡") { action in }
        let faceAction      = UIAction(title:"페이스톡") { action in }
        let presentAction   = UIAction(title:"선물하기") { action in }
        
        let actionProvider = UIMenu(title: "", children: [chatAction, voiceAction, faceAction,presentAction])
        
        let profileViewController = ProfileViewController()
        delegate = profileViewController
        
        switch indexPath.section{
        case 0 :
            self.delegate?.setProfile(data: yoonseoProfile)
        default:
            self.delegate?.setProfile(data: self.friendList[indexPath.row])
        }
        
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider:{return profileViewController},
                                          actionProvider: { suggestedActions in actionProvider })
    }
}

