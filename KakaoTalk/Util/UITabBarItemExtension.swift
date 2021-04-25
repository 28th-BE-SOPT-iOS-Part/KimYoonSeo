//
//  UITabBarItemExtension.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/11.
//

import UIKit

extension UITabBarItem {
    class var friendTab : UITabBarItem {UITabBarItem(title: nil, image: .friendTabIcon, tag: 0)}
    class var talkTab   : UITabBarItem {UITabBarItem(title: nil, image: .messageTabIcon, tag: 0)}
    class var hashTab   : UITabBarItem {UITabBarItem(title: nil, image: .searchTabIcon, tag: 0)}
    class var shopTab   : UITabBarItem {UITabBarItem(title: nil, image: .shopTabIcon, tag: 0)}
    class var moreTab   : UITabBarItem {UITabBarItem(title: nil, image: .detailTabIcon, tag: 0)}
}

