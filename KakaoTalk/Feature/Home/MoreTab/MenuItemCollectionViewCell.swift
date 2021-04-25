//
//  MenuItemCollectionViewCell.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/25.
//

import UIKit
import SnapKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    public static let identifier = "MenuItemCollectionViewCell"
    
    private let cellButton = UIButton()
    private let itemImageView = UIImageView()
    private let itemTextLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        setLayout()
        setAttributes()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func onTapButton() {
        
    }
    
    func setData(image: UIImage,text: String){
        itemImageView.image = image
        itemTextLabel.text = text
    }
    
    func setAttributes(){
        itemTextLabel.then{
            $0.font = .font11
            $0.textAlignment = .center
        }
    }
    
    func setLayout(){
        addSubviews(cellButton,itemImageView,itemTextLabel)
        
        cellButton.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        itemImageView.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(19/812 * UIScreen.main.bounds.height)
        }
        
        itemTextLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(itemImageView.snp.bottom).offset(8/812 * UIScreen.main.bounds.height)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
}
