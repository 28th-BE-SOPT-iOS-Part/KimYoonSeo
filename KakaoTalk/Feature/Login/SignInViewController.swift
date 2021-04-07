//
//  SignInViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit

class SignInViewController: UIViewController {

    public var message                  : String?
    @IBOutlet weak var titleLabel       : UILabel!
    @IBOutlet weak var signInButton     : UIButton!
    
    @IBAction func onClickSignInButton(_ sender: Any) {
        let presentingVC = self.presentingViewController!
        let navigationController = presentingVC is UINavigationController ? presentingVC as? UINavigationController : presentingVC.navigationController

        self.dismiss(animated: true){
            navigationController?.popToRootViewController(animated: true)
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
    }
    
    func setAttribute(){
        signInButton.then{
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.yellow500, for: .normal)
        }
        
        titleLabel.then{
            $0.font = .font20Semibold
            if let msg = message {
                $0.text = msg
            }else{
                $0.text = ""
            }
        }
    }
    

}
