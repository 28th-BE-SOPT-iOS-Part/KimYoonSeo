//
//  SignUpService.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/05/08.
//

import Foundation
import Alamofire

class SignUpService{
    static let shared = SignUpService()
    
    private func makeParameter(email : String, password : String) -> Parameters
    {
        return ["email" : email,
                "password" : password,
                "sex" : "1",
                "nickname" : "내이름은김윤서..",
                "phone" : "010-6515-6030",
                "birth" : "2000-11-26"
        ]
    }
    
    func login(email : String,
               password : String,
               completion : @escaping (NetworkResult<Any>) -> Void)
    {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.signUpURL,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure: completion(.pathErr)
                
            }
        }
                                            
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(SignUpResponse.self, from: data)
        else {
            return .pathErr
        }
        
        switch statusCode {
            
        case 200: return .success(decodedData)
        case 400: return .requestErr(decodedData)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
}

