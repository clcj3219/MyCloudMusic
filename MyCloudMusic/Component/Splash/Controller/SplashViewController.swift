//
//  SplashViewController.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/22.
//

import UIKit
import TangramKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let container = TGRelativeLayout()
        container.tg_top.equal(TGLayoutPos.tg_safeAreaMargin).offset(16)
        container.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin).offset(16)
        container.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin).offset(16)
        container.tg_bottom.equal(TGLayoutPos.tg_safeAreaMargin).offset(16)
        container.backgroundColor = .red
        view.addSubview(container)
    }

}
