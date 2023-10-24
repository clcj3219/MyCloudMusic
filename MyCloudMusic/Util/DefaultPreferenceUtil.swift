//
//  DefaultPreferenceUtil.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/23.
//

import Foundation

class DefaultPreferenceUtil {
    static func isAcceptTermsServiceAgreement() -> Bool {
        return UserDefaults.standard.bool(forKey: TERMS_SERVICE)
    }
    
    static func setAcceptTermsServiceAgreement(_ data: Bool) {
        UserDefaults.standard.set(data, forKey: TERMS_SERVICE)
    }
    
    static let TERMS_SERVICE = "TERMS_SERVICE"
}
