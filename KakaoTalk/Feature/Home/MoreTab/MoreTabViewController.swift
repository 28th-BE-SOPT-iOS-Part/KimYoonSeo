//
//  MoreTabViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/11.
//

import UIKit
import SnapKit

class MoreTabViewController: UIViewController {
    
    private let titleLabel  = UILabel()
    private let topBarView  = UIView()
    private let profileView = UIView()
    private let bottomLine  = UIView()
    
    private let profileImageButton  = UIButton()
    private let profileNameLabel    = UILabel()
    private let profileStateLabel   = UILabel()
    
    private let settingButton       = UIButton()
    
    private var  collectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout:  UICollectionViewFlowLayout())
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        collectionView?.register(MenuItemCollectionViewCell.self, forCellWithReuseIdentifier: MenuItemCollectionViewCell.identifier)
        collectionView?.backgroundView?.backgroundColor = .clear
        collectionView?.backgroundColor = .clear
        
        
        setFunc()
        setLayout()
        setAttributes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    
        
    }

    private func setFunc(){
        
    }
    
    private func setAttributes(){
        
        titleLabel.then{
            $0.text = "더보기"
            $0.font = .font22Bold
        }
        
        settingButton.setBackgroundImage(.settingIcon, for: .normal)
        
        profileImageButton.setBackgroundImage(.profileUserImg, for: .normal)
        
        profileNameLabel.then{
            $0.text = "김윤서"
            $0.font = .font15Semibold
        }
        profileStateLabel.then{
            $0.text = "ezidayzi@gmail.com"
            $0.font = .font11
            $0.textColor = .gray500
        }
        
        bottomLine.backgroundColor = .gray200
    }
    
    private func setLayout(){
        view.addSubviews(topBarView,
                         titleLabel,
                         settingButton,
                         profileView,
                         profileImageButton,
                         profileNameLabel,
                         profileStateLabel,
                         collectionView ?? UICollectionView(),
                         bottomLine
        )
        
        topBarView.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(topBarView)
            $0.leading.equalTo(topBarView.snp.leading).offset(14)
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalTo(topBarView)
            $0.trailing.equalTo(topBarView.snp.trailing).inset(15)
        }
        
        
        profileView.snp.makeConstraints {
            $0.height.equalTo(63)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(topBarView.snp.bottom)
        }
        
        profileImageButton.snp.makeConstraints {
            $0.height.width.equalTo(44)
            $0.centerY.equalTo(profileView)
            $0.leading.equalToSuperview().offset(13)
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageButton.snp.trailing).offset(11)
            $0.top.equalTo(profileView.snp.top).offset(10)
        }
        
        profileStateLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageButton.snp.trailing).offset(11)
            $0.top.equalTo(profileNameLabel.snp.bottom)
        }
        
        collectionView?.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(19)
            $0.leading.equalToSuperview().offset(19)
            $0.trailing.equalToSuperview().inset(19)
            $0.bottom.equalToSuperview()
        }
        
        bottomLine.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(18)
            $0.bottom.equalTo(profileView.snp.bottom)
        }
    }
    

}

extension MoreTabViewController : UICollectionViewDelegate{
    
}

extension MoreTabViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCollectionViewCell.identifier,
                                                                        for: indexPath)
                                                                        as? MenuItemCollectionViewCell
                                                                        else {return UICollectionViewCell() }
        cell.setData(image: .messageTabIcon, text: "메일")
        
        return cell
    }
    
    
}

extension MoreTabViewController : UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let width = UIScreen.main.bounds.width
            
            let cellWidth = width * (70/375)
            let cellHeight = cellWidth
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets.zero
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 3
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 19
        }
}
