//
//  KakaoIcon.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/11.
//

import UIKit

public extension UIImage{
    class var profileTalkImg  : UIImage{fetchKakaoIcon(#function)}
    class var profileCloseBtn : UIImage{fetchKakaoIcon(#function)}
    class var profileEditImg  : UIImage{fetchKakaoIcon(#function)}
    class var profileStoryImg : UIImage{fetchKakaoIcon(#function)}
    class var profileUserImg  : UIImage{fetchKakaoIcon(#function)}
   
    private static func fetchKakaoIcon(_ name : String) -> UIImage{
        guard let icon = UIImage(named: name) else {
            return .profileTalkImg
        }
        return icon
    }
}
