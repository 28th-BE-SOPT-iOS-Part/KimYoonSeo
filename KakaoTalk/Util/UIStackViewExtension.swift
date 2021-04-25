//
//  UIStackViewExtension.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/25.
//

import UIKit

extension UIStackView{
    func addArrangedSubviews(_ views:UIView...){
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
