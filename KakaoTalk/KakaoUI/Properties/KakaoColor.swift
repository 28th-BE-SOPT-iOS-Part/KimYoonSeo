//
//  KakaoColor.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit

public extension UIColor{
    class var black100  : UIColor{fetchKakaoColor(#function)}
    class var gray100   : UIColor{fetchKakaoColor(#function)}
    class var gray500   : UIColor{fetchKakaoColor(#function)}
    class var yellow500 : UIColor{fetchKakaoColor(#function)}
    
    private static func fetchKakaoColor(_ name : String) -> UIColor{
        guard let color = UIColor(named: name) else {
            return .black
        }
        return color
    }
}
