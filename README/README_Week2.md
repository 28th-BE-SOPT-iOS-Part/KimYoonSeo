# Week 2
<img width = 50% src="https://user-images.githubusercontent.com/72497599/115102141-13b41300-9f84-11eb-981f-592a4b69a687.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/115102145-1878c700-9f84-11eb-9e1e-774c34794604.png"/>
<img width = 50% src="https://user-images.githubusercontent.com/72497599/115102148-19a9f400-9f84-11eb-89c3-3e4403de61ce.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/115102149-19a9f400-9f84-11eb-8c04-72e9adb09674.png"/>
<img width = 50% src="https://user-images.githubusercontent.com/72497599/115102143-17479a00-9f84-11eb-9391-4bdf062c16c5.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/115102151-1a428a80-9f84-11eb-9700-cbef91a16668.png"/>

## π κ³Όμ  λμμ 
<img width="80%" src="https://user-images.githubusercontent.com/72497599/114304758-d7aa2980-9b0f-11eb-8312-acb0376b64bf.gif"/>

### βοΈ1μ£Όμ°¨μμ 2μ£Όμ°¨λ‘ μ΄μ΄μ§λ λͺ¨μ΅ π³π

<img width="80%" src="https://user-images.githubusercontent.com/72497599/114304852-64ed7e00-9b10-11eb-8802-9b65446251bb.gif"/>
<br>
<br>

### π’ λμ κ³Όμ  

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

 λ°λ‘ PannableViewControllerλ₯Ό λ§λ λ€ 
  
`ProfileViewController: PannableViewController` μ΄λ°μμΌλ‘ μμλ°μ μ¬μ©νλ€π


### π  μ΄λ €μ λ μ  & μκ²λ μ 

  
#### β¨λ³΄μ΄μ§ μλ κΉλ¦° λ·°... Whyrano..

λμ κ³Όμ π³λ₯Ό νλ μ€, swipe downν΄μ dismissνλ κ² κΉμ§λ κ΅¬ννμΌλ,<br>
swipeμ λ°μ κΉλ €μλ viewκ° μλλ‘ λΉκ²¨μ swipeλ νμμΌ λ³΄μ΄λ λ¬Έμ κ° μμλ€.. μ΄λ €μ£΅.. π©π©π©

```swift
profileViewController.modalPresentationStyle = .overFullScreen
```
`.fullScren`μ΄ μλ `.overFullScreen` μΌλ‘ ν΄μ£Όμ΄μΌ dismissλ λ κΉλ €μλ parent viewcontrollerμ λͺ¨μ΅μ λ³Ό μ μλ€!ππ νν

#### β¨tabbar customνκΈ°
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
μμ κ°μ μ½λλ‘ tabbarμ heightμ tabbar itemμ μμΉλ₯Ό custom ν  μ μλ€.
###### customλ tabbarμ λͺ¨μ΅

<img width="407" alt="αα³αα³αα΅α«αα£αΊ 2021-04-17 αα©αα? 1 48 24" src="https://user-images.githubusercontent.com/72497599/115102050-96889e00-9f83-11eb-90fb-63ab0d15740c.png">
(μμμ°κ³  μμ ν΄μ..μμκ³Όλ λ€λ₯Έ tabbar.. λ€μ λΉννκΈ° λλ κ·μ°?μκ±° μμ£ ..γ)
  
#### β¨storyboard μμ΄ view μ§κΈ° λμ .. 
κ³Όκ°ν storyboardμ scencdelegateκ΄λ ¨ νμΌ,μ½λλ€μ μ­μ νκ³ <br>
μ€λ‘μ§ μ½λλ‘λ§ μΉ΄μΉ΄μ€ν‘ ν΄λ‘ μ½λ©μ ν΄λ³΄λ €κ΅¬ .. νλλ°.. <br>
μ£λΆλ₯Έ λμ μ ννλ₯Ό λΆλ¦λλ€..? μ..<br>

μ μΌ μ΄λ €μ λ λΆλΆμ Navigation Controllerλ₯Ό λ£λ λΆλΆμ΄μλ€.. λ¬΄μΌνΈ..<br>

π³ Appdelegate

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
μ€λ³΄ μμ΄ λκΉμ§ μ ν  μ μμκΉ λ§μΉ..λνΌμλ§μμΈμON.....π±π±


