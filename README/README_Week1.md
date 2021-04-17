# week 1

![B101](https://user-images.githubusercontent.com/72497599/115102331-2418bd80-9f85-11eb-9793-aec6892d6558.png)

<img width = 50% src="https://user-images.githubusercontent.com/72497599/115102322-1a8f5580-9f85-11eb-83fb-a1452ed396d3.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/115102325-1e22dc80-9f85-11eb-949d-ebd2fab2bff7.png"/>
<img width = 50% src="https://user-images.githubusercontent.com/72497599/115102326-1ebb7300-9f85-11eb-8a9b-0c6d860a54e8.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/115102328-1feca000-9f85-11eb-9489-def01a34d8f7.png">

<h2> 과제 동영상 📎</h2>
<img width="60%" src="https://user-images.githubusercontent.com/72497599/113867809-f182fe00-97e9-11eb-862b-cf4b7023c5d4.gif"/>
<br>
<br>
<h2> 구현 과정 🛠 </h2>
<h3> ✔️ 모서리가 둥근 Button </h3>
<p>
  
``` swift
    extension UIButton{
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
            UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
            
            let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
             
            self.setBackgroundImage(backgroundImage, for: state)
        }
    
    func setRoundCorner(_ radius : CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}
```
</p>
<br>
<h3> ✔️ TextField 밑줄 </h3>
<h3> ✔️ TextField Place Holder 속성값 변경하기 </h3>
<p>
  
  ```swift
  extension UITextField {
      func setBottomBorder() {
        self.borderStyle            = .none
        self.layer.backgroundColor  = UIColor.white.cgColor
        self.layer.masksToBounds    = false
        self.layer.shadowColor      = UIColor.gray500.cgColor
        self.layer.shadowOffset     = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity    = 0.8
        self.layer.shadowRadius     = 0.0

      }
    
    func setPlaceHolder(_ text : String, _ color : UIColor, _ font : UIFont) {
        self.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor : color,NSAttributedString.Key.font : font])
    }
}
```
</p>
<br>
<h3> ✔️ Then 라이브러리 없이 then 사용 하기 </h3>
<p>
  
```swift
  extension UIView : Then {}

public protocol Then {}

extension Then where Self  : Any {
    public func then(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}

```

</p>

