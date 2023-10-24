//
//  DefaultService.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/24.
//

import Foundation
import Moya

enum DefaultService {
    case ads(position:Int)
    
    case sheets(size:Int)
    
    case register(data: User)
}

// 实现targetTyoe协议

extension DefaultService:TargetType {
    var baseURL: URL {
        return URL(string: Config.ENDPOINT)!
    }
    
    var path: String {
        switch self {
        case .ads(_):
            return "v1/ads"
        case .sheets:
            return "v1/sheets"
        case .register(_):
            return "v1/users"
        default:
            fatalError("DefaultService path is null")
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .register:
            return .post
        case .ads:
            return .get
        default:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .ads(let position):
            return ParamUtil.urlRequestParamters(["position": position])
        case .sheets(let size):
            return ParamUtil.urlRequestParamters(["size":size])
        default:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        var headers: Dictionary<String,String> = [:]
        
        return headers
    }
    
    
}
