//
//  File.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/23.
//

import UIKit
import TangramKit

class ViewFactoryUtil {
    /// 主色调，小圆角按钮
    static func primaryButton() -> QMUIButton {
        let r = QMUIButton()
        r.adjustsImageTintColorAutomatically = false
        r.adjustsButtonWhenHighlighted = true
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_LARGE)
        r.tg_width.equal(.fill)
        r.tg_height.equal(BUTTON_MEDDLE)
        r.backgroundColor = .colorPrimary
        r.layer.cornerRadius = SMALL_RADIUS
        r.tintColor = .white
        r.setTitleColor(.white, for: .normal)
        return r
    }

    /// 主色调 半圆角
    static func primaryHalfFilletButton() -> QMUIButton {
        let r = primaryButton()
        r.layer.cornerRadius = BUTTON_MEDDLE_RADIUS
        return r
    }
    
    
    /// 链接按钮
    /// - Returns: <#description#>
    static func linkButton() -> QMUIButton {
        let r = QMUIButton()
        r.adjustsTitleTintColorAutomatically = false
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_MEDDLE)
        return r
    }
}
