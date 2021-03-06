//
//  UIAlertControllerExtension.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/26.
//

import UIKit

extension UIAlertController {
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
