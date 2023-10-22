//
//  SplashViewController.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/22.
//

import UIKit
import TangramKit

class SplashViewController: BaseLogicController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorBackground
        
        self.initRelativeLayoutSafeArea()
        
//        let container = TGRelativeLayout()
//        container.tg_top.equal(TGLayoutPos.tg_safeAreaMargin)
//        container.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
//        container.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
//        container.tg_bottom.equal(TGLayoutPos.tg_safeAreaMargin)
//        view.addSubview(container)
        
        // banner
        let bannerView = UIImageView()
        bannerView.tg_width.equal(263)
        bannerView.tg_height.equal(309)
        bannerView.tg_top.equal(120)
        bannerView.tg_centerX.equal(0)
        bannerView.image = UIImage(named: "SplashBanner")
        container.addSubview(bannerView)
        
        // 版权
        let copyRightView = UILabel()
        copyRightView.tg_width.equal(.wrap)
        copyRightView.tg_height.equal(.wrap)
        copyRightView.tg_bottom.equal(16)
        copyRightView.tg_centerX.equal(0)
        copyRightView.font = UIFont.systemFont(ofSize: 12)
        copyRightView.textColor = .gray
        let year = SuperDateUtil.currentYear()
        copyRightView.text = String(format: "Copyright @c %d Ixuea, All Rights Reserved", year)
//        copyRightView.text = NSLocalizedString("ErrorNetworkUnknownHost", comment: "")
//        copyRightView.text = R.string.localizable.errorNetworkUnknownHost()
        container.addSubview(copyRightView)
        
        // logo
        let logoView = UIImageView(image: R.image.splashBanner())
        logoView.tg_width.equal(48)
        logoView.tg_height.equal(48)
        logoView.tg_centerX.equal(0)
        logoView.layer.cornerRadius = 12
        logoView.layer.masksToBounds = true
        logoView.contentMode = .scaleAspectFit
        
        // text
        let logoText = UILabel()
        logoText.tg_width.equal(.wrap)
        logoText.tg_height.equal(30)
        logoText.text = "我的云音乐"
        logoText.font = UIFont.systemFont(ofSize: 24)
        
        let logoContainerView = TGLinearLayout(.horz)
        logoContainerView.tg_width.equal(.wrap)
        logoContainerView.tg_height.equal(48)
        logoContainerView.tg_bottom.equal(copyRightView.tg_bottom).offset(24)
        logoContainerView.tg_centerX.equal(0)
        logoContainerView.tg_gravity = TGGravity.vert.center
        logoContainerView.tg_space = 20
        logoContainerView.addSubview(logoView)
        logoContainerView.addSubview(logoText)
        
        container.addSubview(logoContainerView)
    }
}
