//
//  BaseLogicController.swift
//  项目中通用的逻辑控制器
//
//  Created by yw.hao on 2023/10/22.
//

import UIKit
import TangramKit

class BaseLogicController: BaseCommonController {
    /// 跟容器
    var rootController:TGBaseLayout!
    
    /// 头部
    var superHeaderContainer:TGBaseLayout!
    var superHeaderContentContainer:TGBaseLayout!
    
    /// 底部
    var superFooterContainer:TGBaseLayout!
    var superFooterContentContainer:TGBaseLayout!
    
    
    /// 内容容器
    var container: TGBaseLayout!

    ///初始化relativeLayout容器，四边都在安全区内
    func initRelativeLayoutSafeArea() {
        initLinearLayout()
        
        initHeaderContainer()
        
        // 内容
        container = TGRelativeLayout()
        container.tg_width.equal(.fill)
        container.tg_height.equal(.fill)
        container.backgroundColor = .clear
        rootController.addSubview(container)
        
        initFootContainer()
    }
    
    func initLinearLayout() {
        rootController = TGLinearLayout(.vert)
        rootController.tg_width.equal(.fill)
        rootController.tg_height.equal(.fill)
        rootController.backgroundColor = .clear
        view.addSubview(rootController)
    }

    // 头部容器，安全区外，一般来设置头部到安全区外背景颜色
    func initHeaderContainer() {
        superHeaderContainer = TGLinearLayout(.vert)
        superHeaderContainer.tg_width.equal(.fill)
        superHeaderContainer.tg_height.equal(.wrap)
        superHeaderContainer.backgroundColor = .clear
        
        //头部内容容器
        superHeaderContentContainer = TGLinearLayout(.vert)
        superHeaderContentContainer.tg_height.equal(.wrap)
        superHeaderContentContainer.tg_top.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.backgroundColor = .clear
        
        superHeaderContainer.addSubview(superHeaderContentContainer)
        rootController.addSubview(superHeaderContainer)
    }
    
    func initFootContainer() {
        superFooterContainer = TGLinearLayout(.vert)
        superFooterContainer.tg_width.equal(.fill)
        superFooterContainer.tg_height.equal(.wrap)
        superFooterContainer.backgroundColor = .clear
        
        // 底部容器内部容器，安全区内部
        superFooterContentContainer = TGLinearLayout(.vert)
        superFooterContentContainer.tg_height.equal(.wrap)
        superFooterContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_bottom.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.backgroundColor = .clear
        
        superFooterContainer.addSubview(superFooterContentContainer)
        rootController.addSubview(superFooterContainer)
    }
    
    override func initViews() {
        super.initViews()
        setBackgroundColor(.colorBackground)
    }
}
