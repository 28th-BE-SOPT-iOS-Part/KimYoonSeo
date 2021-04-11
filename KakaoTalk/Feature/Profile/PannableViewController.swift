//
//  PannableViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/11.
//

import UIKit

class PannableViewController: UIViewController {
    
      private var panGestureRecognizer: UIPanGestureRecognizer?
     
      override func viewDidLoad() {
        super.viewDidLoad()
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGestureRecognizer!)
        
      }
      
    @objc
    func panGestureAction(_ sender: UIPanGestureRecognizer) {
        let translationY = sender.translation(in: sender.view!).y

        switch sender.state {
        case .began:
            break
        case .changed:
            if translationY > 0 {
                view.transform = CGAffineTransform(translationX: 0, y: translationY)}
        case .ended, .cancelled:
            if translationY > 400 {
                dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            }
        case .failed, .possible:
            break
        @unknown default:
            break
        }
        
      }
}
