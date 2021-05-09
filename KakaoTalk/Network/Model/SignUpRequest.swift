//
//  SignUpRequest.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/05/08.
//

import Foundation

struct SignUpRequest: Codable {
    let email : String
    let password : String
    let sex : String
    let nickname: String
    let phone: String
    let birth: String
}
