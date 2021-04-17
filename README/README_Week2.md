# Week 2
<img width = 50% src="https://user-images.githubusercontent.com/72497599/115102141-13b41300-9f84-11eb-981f-592a4b69a687.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/115102145-1878c700-9f84-11eb-9e1e-774c34794604.png"/>
<img width = 50% src="https://user-images.githubusercontent.com/72497599/115102148-19a9f400-9f84-11eb-89c3-3e4403de61ce.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/115102149-19a9f400-9f84-11eb-8c04-72e9adb09674.png"/>
<img width = 50% src="https://user-images.githubusercontent.com/72497599/115102143-17479a00-9f84-11eb-9391-4bdf062c16c5.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/115102151-1a428a80-9f84-11eb-9700-cbef91a16668.png"/>

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


### 🛠 어려웠던 점 & 알게된 점

  
#### ✨보이지 않는 깔린 뷰... Whyrano..

도전과제😳를 하던 중, swipe down해서 dismiss하는 것 까지는 구현했으나,<br>
swipe시 밑에 깔려있는 view가 아래로 당겨서 swipe된 후에야 보이는 문제가 있었다.. 살려죵.. 😩😩😩

```swift
profileViewController.modalPresentationStyle = .overFullScreen
```
`.fullScren`이 아닌 `.overFullScreen` 으로 해주어야 dismiss될때 깔려있는 parent viewcontroller의 모습을 볼 수 있다!😃😃 히히

#### ✨tabbar custom하기
```swift
 private func setUpTabBar(){
        tabBar.setUpUITabBar()
        tabBar.frame.size.height = 92
        tabBar.frame.origin.y = view.frame.height - 92
        tabBar.tintColor = .black
        tabBar.backgroundColor = .gray100
        
        [friendTab,talkTab,hashTab,shopTab,moreTab].forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        }
        
    }
```
위와 같은 코드로 tabbar의 height와 tabbar item의 위치를 custom 할 수 있다.
###### custom된 tabbar의 모습

<img width="407" alt="스크린샷 2021-04-17 오후 1 48 24" src="https://user-images.githubusercontent.com/72497599/115102050-96889e00-9f83-11eb-90fb-63ab0d15740c.png">
(영상찍고 수정해서..영상과는 다른 tabbar.. 다시 녹화하기 넘나 귀찮은거 있죠..ㅎ)
  
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
스보 없이 끝까지 잘 할 수 있을까 마치..나혼자만의싸움ON.....😱😱


