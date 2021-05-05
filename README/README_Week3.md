# Week3

## 📎 과제 
### 친구 목록 table view 구현
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 19 57 03](https://user-images.githubusercontent.com/72497599/116072344-ea089380-a6c9-11eb-8a80-d6776801532c.png)


<br><br>

### delegate를 이용한 데이터 전달
<img width = 50% src="https://user-images.githubusercontent.com/72497599/116072350-ed038400-a6c9-11eb-9170-2ac51ad15c89.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/116072352-ed9c1a80-a6c9-11eb-88c5-32c4112be2c4.png"/>
<img width = 50% src="https://user-images.githubusercontent.com/72497599/116072355-ee34b100-a6c9-11eb-922d-a0faf0616ecd.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/116072358-ee34b100-a6c9-11eb-9fea-7b2609c3cc36.png"/>
delegate 하다가 진짜 헤멨는 데여...<br>
아직도 맞게 한건지 모르겠어요.. 알려주실 분?<br>
일단 결과물은 맞게 나왔늗ㄴㄷ ㅔ......... 모르겠서요 어려워요,,,,, 이게 맞나 싶어요...<br>
되면 왜돼? 안되면 왜안돼?????를 백만번 외쳤습니다<br>

<br><br>

### collection view 구현
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 01 51 02](https://user-images.githubusercontent.com/72497599/116001948-31dbdc00-a632-11eb-82a3-2b3161a52dd0.png)
<br>코드베이스로 짤때 꼭 써줘야 하는 ..<br>

```swift
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout:  UICollectionViewFlowLayout())
        collectionView?.register(MenuItemCollectionViewCell.self, forCellWithReuseIdentifier: MenuItemCollectionViewCell.identifier)
        collectionView?.backgroundView?.backgroundColor = .clear
        collectionView?.backgroundColor = .clear
```
이유는 모르겠는데 자꾸 까만색 바탕이 나와서 clear로 해줬습니당..


## 😳 도전과제
이거 너무 구글링해서.. .... .. ..할 말 이 업 씁 ...니다.. 

### Action Sheet
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 19 57 55](https://user-images.githubusercontent.com/72497599/116072360-eecd4780-a6c9-11eb-876e-41304824edc0.png)

이거 하다보면 
<img width="100%" alt="스크린샷 2021-04-26 오전 12 23 47" src="https://user-images.githubusercontent.com/72497599/116002911-c7796a80-a636-11eb-9032-9bc73ae00f82.png">
<br>이렇게 생긴 에러를 직면할 수 있을 거예요.. 레이아웃 어쩌구 하는데 구글링 해보니까 iOS버그래요..ㅎ..후..... 저희는 잘못한게 없답니다..?,,,

귀찮지만 저 까만색에 흰글씨를 보기 싫다면 손수 버그를 잡아줘야해요.. ㅠ.. 물론 이것도 구글...(구글ㅅㄹㅎ...~)

```swift
extension UIAlertController {
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}

```
짠 이렇게 하면 더이상 뜨지 않아요 ㅎ,

```swift
@objc func onClickSettingButton(){
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: "편집", style: .default, handler: {

            (alert: UIAlertAction!) -> Void in

        })

        let managementAction = UIAlertAction(title: "친구 관리", style: .default, handler: {

            (alert: UIAlertAction!) -> Void in

        })


        let settinglAction = UIAlertAction(title: "전체 설정", style: .default, handler: {

            (alert: UIAlertAction!) -> Void in

        })

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {

            (alert: UIAlertAction!) -> Void in

        })
        
        optionMenu.pruneNegativeWidthConstraints()

        optionMenu.addAction(editAction)
        optionMenu.addAction(managementAction)
        optionMenu.addAction(settinglAction)
        optionMenu.addAction(cancelAction)

        self.present(optionMenu, animated: true, completion: nil)

    }
```

### TableView Swipe Action
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 19 58 48](https://user-images.githubusercontent.com/72497599/116072366-f0970b00-a6c9-11eb-9aaf-9c6a581d908a.png)

```swift
func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {


        let hideAction = UIContextualAction(style: .normal, title: "숨김", handler: { (action, view, success) in
         })
        
        let banAction = UIContextualAction(style: .normal, title: "차단", handler: { (action, view, success) in

         })
        
        hideAction.backgroundColor = .gray
        banAction.backgroundColor = .red500
        
        let configuration = UISwipeActionsConfiguration(actions: [banAction,hideAction])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
   }
```

스와이프가 너무 끝까지 되어서 막아주기 위해 
`let configuration = UISwipeActionsConfiguration(actions: [banAction,hideAction])
 configuration.performsFirstActionWithFullSwipe = false`
 이렇게 해줬어요!


### Contextual Menu
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 19 58 43](https://user-images.githubusercontent.com/72497599/116072365-effe7480-a6c9-11eb-80e8-49e4c9b918db.png)
```swift
func tableView(_ tableView: UITableView,
                            contextMenuConfigurationForRowAt indexPath: IndexPath,
                            point: CGPoint) -> UIContextMenuConfiguration? {
        
        
        let chatAction      = UIAction(title:"채팅하기") { action in }
        let voiceAction     = UIAction(title:"보이스톡") { action in }
        let faceAction      = UIAction(title:"페이스톡") { action in }
        let presentAction   = UIAction(title:"선물하기") { action in }
        
        let actionProvider = UIMenu(title: "", children: [chatAction, voiceAction, faceAction,presentAction])
        
        let profileViewController = ProfileViewController()
        delegate = profileViewController
        
        switch indexPath.section{
        case 0 :
            self.delegate?.setProfile(data: yoonseoProfile)
        default:
            self.delegate?.setProfile(data: self.friendList[indexPath.row])
        }
        
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider:{return profileViewController},
                                          actionProvider: { suggestedActions in actionProvider })
    }
```
그냥하면 안되고 다른 곳과 마찬가지로 delegate를 통해 데이터를 넘겨주어야만 원하는 대로 할 수 있었습니다..

