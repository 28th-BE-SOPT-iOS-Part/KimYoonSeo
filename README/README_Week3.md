# Week3

## 📎 과제 
### 친구 목록 table view 구현
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 01 50 36](https://user-images.githubusercontent.com/72497599/116001941-2be5fb00-a632-11eb-8787-7ba8b16fa258.png)

프로필 cell과 친구 목록에 들어갈 cell 두개를 각각 만들어 준 다음, `indexPath.row` 의 값에 따라 각각의 cell을 대입해주었습니다 :-)
```swift
       if indexPath.row == 0 {
            //프로필
        } else {
            //친구목록
        }
```
이런식으로요!! heightForRowAt , didSelectRowAt , cellForRowAt 등등에서 다 저렇게 분기쳐서 구현했습니다,,
<br><br>

### delegate를 이용한 데이터 전달
<img width = 33% src="https://user-images.githubusercontent.com/72497599/116001945-30121880-a632-11eb-94fb-2a8aa10fe78f.png"/><img width = 33% src="https://user-images.githubusercontent.com/72497599/116001946-30aaaf00-a632-11eb-96c1-fdbc6ad7bd36.png"/><img width = 33% src="https://user-images.githubusercontent.com/72497599/116001947-31434580-a632-11eb-987f-60454cf86411.png"/>
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
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 01 50 39](https://user-images.githubusercontent.com/72497599/116001944-2ee0eb80-a632-11eb-9a96-972a6cc04213.png)

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
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 01 51 26](https://user-images.githubusercontent.com/72497599/116001950-33a59f80-a632-11eb-9dd4-d89e4e7a5f26.png)

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

### Contextual Menu
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 01 51 20](https://user-images.githubusercontent.com/72497599/116001949-32747280-a632-11eb-8578-0206176654e4.png)
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
        
        if indexPath.row == 0{
            self.delegate?.setProfile(data: yoonseoProfile)
        }
        else{
            self.delegate?.setProfile(data: self.friendList[indexPath.row - 1])
        }
        
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider:{return profileViewController},
                                          actionProvider: { suggestedActions in actionProvider })
    }
```
