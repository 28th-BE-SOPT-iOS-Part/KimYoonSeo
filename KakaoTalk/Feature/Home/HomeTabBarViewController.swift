//
//  HomeTabBarViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/10.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    public var friendTab    = FriendTabViewController()
    public var talkTab      = TalkTabViewController()
    public var hashTab      = HashTabViewController()
    public var shopTab      = ShopTabViewController()
    public var moreTab      = MoreTabViewController()
    
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
        tabBar.frame.size.height = 92
        tabBar.frame.origin.y = view.frame.height - 92
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
