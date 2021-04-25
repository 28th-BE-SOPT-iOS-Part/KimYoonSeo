//
//  HomeTabBarViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/10.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    public let friendTab    = FriendTabViewController()
    public let talkTab      = TalkTabViewController()
    public let hashTab      = HashTabViewController()
    public let shopTab      = ShopTabViewController()
    public let moreTab      = MoreTabViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTabBarItem()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpTabBar()
    }

    private func setUpTabBar(){
        tabBar.setUpUITabBar()
        tabBar.tintColor = .black
        tabBar.backgroundColor = .gray100
        
        [friendTab,talkTab,hashTab,shopTab,moreTab].forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        }
        
    }
    
    private func setUpTabBarItem(){
        self.viewControllers = [friendTab,talkTab,hashTab,shopTab,moreTab]
        
        friendTab.tabBarItem    = .friendTab
        talkTab.tabBarItem      = .talkTab
        hashTab.tabBarItem      = .hashTab
        shopTab.tabBarItem      = .shopTab
        moreTab.tabBarItem      = .moreTab
    }
    
}
