//
//  TermServiceDialogController.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/23.
//

import UIKit

import TangramKit

class TermServiceDialogController: BaseController, QMUIModalPresentationContentViewControllerProtocol {
    var contentContainer: TGBaseLayout!
    var modalController: QMUIModalPresentationViewController!
    var textView:UITextView!
    var disagreeButton:QMUIButton!
    
    override func initViews() {
        super.initViews()
        
        view.layer.cornerRadius = MEDDLE_RADIUS
        view.clipsToBounds = true
        view.backgroundColor = .gray
        view.tg_width.equal(.fill)
        view.tg_height.equal(.wrap)
        
        // 内容容器
        contentContainer = TGLinearLayout(.vert)
        contentContainer.tg_width.equal(.fill)
        contentContainer.tg_height.equal(.wrap)
        contentContainer.tg_space = 25
        contentContainer.backgroundColor = .colorBackground
        contentContainer.tg_padding = UIEdgeInsets(top: PADDING_OUTER, left: PADDING_OUTER, bottom: PADDING_OUTER, right: PADDING_OUTER)
        contentContainer.tg_gravity = TGGravity.horz.center
        
        view.addSubview(contentContainer)
        
        // 标题
        contentContainer.addSubview(titleView)
        
        textView = UITextView()
        textView.tg_width.equal(.fill)
        textView.tg_height.equal(230)
        textView.text = "这些方法允许开发者在特定的时间点介入视图或视图控制器的生命周期，以执行特定的任务，如更新UI、加载数据等。如果initDatum是某个特定项目的方法，它可能是在某个生命周期方法中被调用，用于初始化或加载数据。这些方法允许开发者在特定的时间点介入视图或视图控制器的生命周期，以执行特定的任务，如更新UI、加载数据等。如果initDatum是某个特定项目的方法，它可能是在某个生命周期方法中被调用，用于初始化或加载数据。这些方法允许开发者在特定的时间点介入视图或视图控制器的生命周期，以执行特定的任务，如更新UI、加载数据等。如果initDatum是某个特定项目的方法，它可能是在某个生命周期方法中被调用，用于初始化或加载数据。这些方法允许开发者在特定的时间点介入视图或视图控制器的生命周期，以执行特定的任务，如更新UI、加载数据等。如果initDatum是某个特定项目的方法，它可能是在某个生命周期方法中被调用，用于初始化或加载数据。这些方法允许开发者在特定的时间点介入视图或视图控制器的生命周期，以执行特定的任务，如更新UI、加载数据等。如果initDatum是某个特定项目的方法，它可能是在某个生命周期方法中被调用，用于初始化或加载数据。这些方法允许开发者在特定的时间点介入视图或视图控制器的生命周期，以执行特定的任务，如更新UI、加载数据等。如果initDatum是某个特定项目的方法，它可能是在某个生命周期方法中被调用，用于初始化或加载数据。这些方法允许开发者在特定的时间点介入视图或视图控制器的生命周期，以执行特定的任务，如更新UI、加载数据等。如果initDatum是某个特定项目的方法，它可能是在某个生命周期方法中被调用，用于初始化或加载数据。这些方法允许开发者在特定的时间点介入视图或视图控制器的生命周期，以执行特定的任务，如更新UI、加载数据等。如果initDatum是某个特定项目的方法，它可能是在某个生命周期方法中被调用，用于初始化或加载数据。"
        textView.backgroundColor = .clear
        textView.isEditable = false
        contentContainer.addSubview(textView)
        contentContainer.addSubview(primaryButton)
        
        // 不同意按钮
        disagreeButton = ViewFactoryUtil.linkButton()
        disagreeButton.setTitle("不同意并退出应用", for: .normal)
        disagreeButton.setTitleColor(.gray, for: .normal)
        disagreeButton.addTarget(self, action:  #selector(disagreeClick(_:)), for: .touchUpInside)
        disagreeButton.sizeToFit()
        contentContainer.addSubview(disagreeButton)
    }
    
    @objc func disagreeClick(_ sender: QMUIButton) {
        hide()
        
        exit(0)
    }
    
    func show() {
        modalController = QMUIModalPresentationViewController()
        modalController.animationStyle = .fade
        
        modalController.contentViewMargins = UIEdgeInsets(top: PADDING_LARGE2, left: PADDING_LARGE2, bottom: PADDING_LARGE2, right: PADDING_LARGE2)
        modalController.isModal = true
        modalController.contentViewController = self
        
        modalController.showWith(animated: true)
    }
    
    func hide() {
        modalController.hideWith(animated: true)
    }
    
    lazy var titleView: UILabel = {
        let r = UILabel()
        r.tg_width.equal(.fill)
        r.tg_height.equal(.wrap)
        r.text = "标题"
        r.textColor = .black
        r.font = UIFont.boldSystemFont(ofSize: TEXT_LARGE2)
        r.textAlignment = .center
        return r
    }()
    
    lazy var primaryButton: QMUIButton =  {
        let b = ViewFactoryUtil.primaryHalfFilletButton()
        b.setTitle("同意", for: .normal)
        return b
    }()

}
