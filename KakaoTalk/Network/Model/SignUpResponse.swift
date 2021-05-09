//
//  SignUpResponse.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/05/08.
//

import Foundation

struct SignUpResponse: Codable {
    let success: Bool
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
    }
    
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}
