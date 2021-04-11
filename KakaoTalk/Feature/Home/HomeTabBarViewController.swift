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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = .white
        setUpTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpTabBarItem()
    }
    
    private func setUpTabBar(){
        tabBar.setUpUITabBar()
        tabBar.frame.size.height = 92
        tabBar.frame.origin.y = view.frame.height - 92
        tabBar.tintColor = .black
        tabBar.backgroundColor = .gray100
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
