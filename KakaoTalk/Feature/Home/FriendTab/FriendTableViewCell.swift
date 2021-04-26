//
//  FriendTableViewCell.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/25.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    public static let identifier : String = "friendTableViewCell"
    
    private let profileImageButton  = UIButton()
    private let profileNameLabel    = UILabel()
    private let profileStateLabel   = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setFunc()
        setLayout()
        setAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(profile : FriendDataModel){
        profileImageButton.setBackgroundImage(profile.image, for: .normal)
        profileNameLabel.text = profile.name
        profileStateLabel.text = profile.state
    }
    
    func setFunc(){
        
    }
    
    func setLayout(){
        addSubviews(profileStateLabel,profileImageButton,profileNameLabel)
        
        profileImageButton.snp.makeConstraints {
            $0.height.width.equalTo(40)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageButton.snp.trailing).offset(11)
            $0.top.equalToSuperview().offset(10)
        }
        
        profileStateLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageButton.snp.trailing).offset(11)
            $0.top.equalTo(profileNameLabel.snp.bottom)
        }
    }
    
    private func setAttributes(){
        profileNameLabel.then {
            $0.font = .font12Semibold
            $0.textAlignment = .left
            $0.textColor = .black100
        }
        
        profileStateLabel.then{
            $0.font = .font11
            $0.textAlignment = .left
            $0.textColor = .gray500
        }
    }

}
