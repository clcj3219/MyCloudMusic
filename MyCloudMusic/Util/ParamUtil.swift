//
//  ParamUtil.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/24.
//

import Foundation
import Moya

class ParamUtil {
    static func urlRequestParamters(_ data:[String:Any]) -> Task {
        return .requestParameters(parameters: data, encoding: URLEncoding.default)
    }
}
