//
//  UIViewExtension.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit

//짭 then..ㅎ
extension UIView : Then {}

public protocol Then {}

extension Then where Self  : Any {
    public func then(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}
