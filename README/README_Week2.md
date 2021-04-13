# Week 2

## 📎 과제 동영상 
<img width="80%" src="https://user-images.githubusercontent.com/72497599/114304758-d7aa2980-9b0f-11eb-8312-acb0376b64bf.gif"/>

### ✔️1주차에서 2주차로 이어지는 모습 😳📖

<img width="80%" src="https://user-images.githubusercontent.com/72497599/114304852-64ed7e00-9b10-11eb-8802-9b65446251bb.gif"/>
<br>
<br>

### 📢 도전과제 

```swift
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
            if translationY > 200 {
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
```

 따로 PannableViewController를 만든뒤 
  
`ProfileViewController: PannableViewController` 이런식으로 상속받아 사용했다😃


### 🛠 어려웠던 점 

  
#### ✨보이지 않는 깔린 뷰... Whyrano..

도전과제😳를 하던 중, swipe down해서 dismiss하는 것 까지는 구현했으나,<br>
swipe시 밑에 깔려있는 view가 아래로 당겨서 swipe된 후에야 보이는 문제가 있었다.. 살려죵.. 😩😩😩

```swift
profileViewController.modalPresentationStyle = .overFullScreen
```
`.fullScren`이 아닌 `.overFullScreen` 으로 해주어야 dismiss될때 깔려있는 parent viewcontroller의 모습을 볼 수 있다!😃😃 히히
  
#### ✨storyboard 없이 view 짜기 도전.. 
과감히 storyboard와 scencdelegate관련 파일,코드들을 삭제하고<br>
오로지 코드로만 카카오톡 클론코딩을 해보려구 .. 했는데.. <br>
섣부른 도전은 후회를 부릅니다..? 예..<br>

제일 어려웠던 부분은 Navigation Controller를 넣는 부분이었다.. 무야호..<br>

😳 Appdelegate

```swift
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let viewController = LoginViewController(nibName: nil, bundle: nil) 
        navigationController.viewControllers = [viewController]
        viewController.navigationController?.navigationBar.isHidden = true
        window!.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        return true
    }
```
스보 없이 끝까지 잘 할 수 있을까여 나홀로ON.....😱😱


