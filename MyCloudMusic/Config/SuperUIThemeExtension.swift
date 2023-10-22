//
//  SuperUIThemeExtension.swift
//  动态颜色
//
//  Created by yw.hao on 2023/10/22.
//

import UIKit

extension UIColor {
    static var colorPrimary: UIColor {
        return .initColor(normal: .primaryColor, dark: .primaryColor)
    }
    
    static var colorBackground: UIColor {
        return .initColor(normal: .white, dark: .black)
    }
    
    static func initColor(normal: UIColor, dark: UIColor) -> UIColor {
        if #available(ios 13.0, *) {
            return UIColor{ (traitCollection) -> UIColor in
                return traitCollection.userInterfaceStyle == .dark ? dark: normal
            }
        } else {
            return normal
        }
    }
}
