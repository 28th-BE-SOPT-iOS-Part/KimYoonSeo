# Week3

## ๐ ๊ณผ์  
### ์น๊ตฌ ๋ชฉ๋ก table view ๊ตฌํ
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 19 57 03](https://user-images.githubusercontent.com/72497599/116072344-ea089380-a6c9-11eb-8a80-d6776801532c.png)


<br><br>

### delegate๋ฅผ ์ด์ฉํ ๋ฐ์ดํฐ ์ ๋ฌ
<img width = 50% src="https://user-images.githubusercontent.com/72497599/116072350-ed038400-a6c9-11eb-9170-2ac51ad15c89.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/116072352-ed9c1a80-a6c9-11eb-88c5-32c4112be2c4.png"/>
<img width = 50% src="https://user-images.githubusercontent.com/72497599/116072355-ee34b100-a6c9-11eb-922d-a0faf0616ecd.png"/><img width = 50% src="https://user-images.githubusercontent.com/72497599/116072358-ee34b100-a6c9-11eb-9fea-7b2609c3cc36.png"/>
delegate ํ๋ค๊ฐ ์ง์ง ํค๋ฉจ๋ ๋ฐ์ฌ...<br>
์์ง๋ ๋ง๊ฒ ํ๊ฑด์ง ๋ชจ๋ฅด๊ฒ ์ด์.. ์๋ ค์ฃผ์ค ๋ถ?<br>
์ผ๋จ ๊ฒฐ๊ณผ๋ฌผ์ ๋ง๊ฒ ๋์๋ใดใท ใ......... ๋ชจ๋ฅด๊ฒ ์์ ์ด๋ ค์์,,,,, ์ด๊ฒ ๋ง๋ ์ถ์ด์...<br>
๋๋ฉด ์๋ผ? ์๋๋ฉด ์์๋ผ?????๋ฅผ ๋ฐฑ๋ง๋ฒ ์ธ์ณค์ต๋๋ค<br>

<br><br>

### collection view ๊ตฌํ
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 01 51 02](https://user-images.githubusercontent.com/72497599/116001948-31dbdc00-a632-11eb-82a3-2b3161a52dd0.png)
<br>์ฝ๋๋ฒ ์ด์ค๋ก ์งค๋ ๊ผญ ์จ์ค์ผ ํ๋ ..<br>

```swift
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout:  UICollectionViewFlowLayout())
        collectionView?.register(MenuItemCollectionViewCell.self, forCellWithReuseIdentifier: MenuItemCollectionViewCell.identifier)
        collectionView?.backgroundView?.backgroundColor = .clear
        collectionView?.backgroundColor = .clear
```
์ด์ ๋ ๋ชจ๋ฅด๊ฒ ๋๋ฐ ์๊พธ ๊น๋ง์ ๋ฐํ์ด ๋์์ clear๋ก ํด์คฌ์ต๋๋น..


## ๐ณ ๋์ ๊ณผ์ 
์ด๊ฑฐ ๋๋ฌด ๊ตฌ๊ธ๋งํด์.. .... .. ..ํ  ๋ง ์ด ์ ์ ...๋๋ค.. 

### Action Sheet
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 19 57 55](https://user-images.githubusercontent.com/72497599/116072360-eecd4780-a6c9-11eb-876e-41304824edc0.png)

์ด๊ฑฐ ํ๋ค๋ณด๋ฉด 
<img width="100%" alt="แแณแแณแแตแซแแฃแบ 2021-04-26 แแฉแแฅแซ 12 23 47" src="https://user-images.githubusercontent.com/72497599/116002911-c7796a80-a636-11eb-9032-9bc73ae00f82.png">
<br>์ด๋ ๊ฒ ์๊ธด ์๋ฌ๋ฅผ ์ง๋ฉดํ  ์ ์์ ๊ฑฐ์์.. ๋ ์ด์์ ์ด์ฉ๊ตฌ ํ๋๋ฐ ๊ตฌ๊ธ๋ง ํด๋ณด๋๊น iOS๋ฒ๊ทธ๋์..ใ..ํ..... ์ ํฌ๋ ์๋ชปํ๊ฒ ์๋ต๋๋ค..?,,,

๊ท์ฐฎ์ง๋ง ์  ๊น๋ง์์ ํฐ๊ธ์จ๋ฅผ ๋ณด๊ธฐ ์ซ๋ค๋ฉด ์์ ๋ฒ๊ทธ๋ฅผ ์ก์์ค์ผํด์.. ใ .. ๋ฌผ๋ก  ์ด๊ฒ๋ ๊ตฌ๊ธ...(๊ตฌ๊ธใในใ...~)

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
์ง  ์ด๋ ๊ฒ ํ๋ฉด ๋์ด์ ๋จ์ง ์์์ ใ,

```swift
@objc func onClickSettingButton(){
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let editAction = UIAlertAction(title: "ํธ์ง", style: .default, handler: {

            (alert: UIAlertAction!) -> Void in

        })

        let managementAction = UIAlertAction(title: "์น๊ตฌ ๊ด๋ฆฌ", style: .default, handler: {

            (alert: UIAlertAction!) -> Void in

        })


        let settinglAction = UIAlertAction(title: "์ ์ฒด ์ค์ ", style: .default, handler: {

            (alert: UIAlertAction!) -> Void in

        })

        let cancelAction = UIAlertAction(title: "์ทจ์", style: .cancel, handler: {

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


        let hideAction = UIContextualAction(style: .normal, title: "์จ๊น", handler: { (action, view, success) in
         })
        
        let banAction = UIContextualAction(style: .normal, title: "์ฐจ๋จ", handler: { (action, view, success) in

         })
        
        hideAction.backgroundColor = .gray
        banAction.backgroundColor = .red500
        
        let configuration = UISwipeActionsConfiguration(actions: [banAction,hideAction])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
   }
```

์ค์์ดํ๊ฐ ๋๋ฌด ๋๊น์ง ๋์ด์ ๋ง์์ฃผ๊ธฐ ์ํด 
`let configuration = UISwipeActionsConfiguration(actions: [banAction,hideAction])
 configuration.performsFirstActionWithFullSwipe = false`
 ์ด๋ ๊ฒ ํด์คฌ์ด์!


### Contextual Menu
![Simulator Screen Shot - iPhone 11 - 2021-04-26 at 19 58 43](https://user-images.githubusercontent.com/72497599/116072365-effe7480-a6c9-11eb-80e8-49e4c9b918db.png)
```swift
func tableView(_ tableView: UITableView,
                            contextMenuConfigurationForRowAt indexPath: IndexPath,
                            point: CGPoint) -> UIContextMenuConfiguration? {
        
        
        let chatAction      = UIAction(title:"์ฑํํ๊ธฐ") { action in }
        let voiceAction     = UIAction(title:"๋ณด์ด์คํก") { action in }
        let faceAction      = UIAction(title:"ํ์ด์คํก") { action in }
        let presentAction   = UIAction(title:"์ ๋ฌผํ๊ธฐ") { action in }
        
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
๊ทธ๋ฅํ๋ฉด ์๋๊ณ  ๋ค๋ฅธ ๊ณณ๊ณผ ๋ง์ฐฌ๊ฐ์ง๋ก delegate๋ฅผ ํตํด ๋ฐ์ดํฐ๋ฅผ ๋๊ฒจ์ฃผ์ด์ผ๋ง ์ํ๋ ๋๋ก ํ  ์ ์์์ต๋๋ค..

