//
//  SuperDateUtil.swift
//  日期工具类
//
//  Created by yw.hao on 2023/10/22.
//

import Foundation

class SuperDateUtil {
    static func currentYear() -> Int {
        // 当前日期
        let date = Date()
        
        let calendar = Calendar.current
        
        let d = calendar.dateComponents([Calendar.Component.year, Calendar.Component.month], from: date)
        
        return d.year!
    }
}
