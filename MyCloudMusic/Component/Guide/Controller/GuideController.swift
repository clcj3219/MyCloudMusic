//
//  GuideController.swift
//  引导界面
//
//  Created by yw.hao on 2023/10/23.
//

import UIKit
import TangramKit
import Moya
import RxSwift
import NSObject_Rx

class GuideController: BaseLogicController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLinearLayoutSafeArea()
        
        // 按钮容器
        let controlContainer = TGLinearLayout(.horz)
        controlContainer.tg_bottom.equal(PADDING_OUTER)
        controlContainer.tg_width ~= .fill
        controlContainer.tg_height.equal(.wrap)
        
        // 水平拉升，左中右间距一样
        controlContainer.tg_gravity = TGGravity.horz.among
        container.addSubview(controlContainer)
        
        // 登录注册按钮
        let primaryButton = ViewFactoryUtil.primaryButton()
        primaryButton.setTitle(R.string.localizable.loginOrRegister(), for: .normal)
        primaryButton.addTarget(self, action: #selector(primaryClick(_:)), for: .touchUpInside)
        primaryButton.tg_width.equal(BUTTON_WIDTH_MEDDLE)
        controlContainer.addSubview(primaryButton)
        
        // 立即体验按钮
        let enterButton = ViewFactoryUtil.primaryOutlineButton()
        enterButton.setTitle("立即体验", for: .normal)
        enterButton.addTarget(self, action: #selector(enterClick(_:)), for: .touchUpInside)
        enterButton.tg_width.equal(BUTTON_WIDTH_MEDDLE)
        controlContainer.addSubview(enterButton)
    }
    
    @objc func primaryClick(_ sender:QMUIButton) {
        AppDelegate.shared.toLogin()
    }
    
    @objc func enterClick(_ sender: QMUIButton) {
        //        AppDelegate.shared.toMain()
        
        let provider = MoyaProvider<DefaultService>()
        //        provider.request(.sheets(size: 10)) {result in
        //            print(result)
        //
        //            switch result {
        //            case let .success(response):
        //                let data = response.data
        //                let statusCode = response.statusCode
        //
        //                let dataString = String(data: data, encoding: .utf8)!
        //                print(dataString)
        //            default:
        //                print("request error")
        //            }
        //        }
        // rxSwift方式
        provider.rx.request(.sheets(size: 10))
            .subscribe{ event in
                switch event {
                case let .success(response):
                    let data = response.data
                    let statusCode = response.statusCode
                    
                    let dataString = String(data: data, encoding: .utf8)!
                    if let r = SheetListResponse.deserialize(from: dataString) {
                        print(r.status)
                        print(r.data.data[0].title!)
                    }
                case let .failure(error):
                    print("network error")
                }
            }.disposed(by: rx.disposeBag)
        
        
    }
    
}
