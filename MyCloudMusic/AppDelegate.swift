//
//  AppDelegate.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    open class var shared:AppDelegate{
        get{
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller = SplashViewController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = controller
        window!.makeKeyAndVisible()
        return true
    }

    /// 跳转到引导界面
    func toGuide() {
        let r = GuideController()
        setRootViewController(r)
    }
    
    /// 跳转到首页
    func toMain() {
        let r = UINavigationController(rootViewController: MainController())
        setRootViewController(r)
    }
    
    /// 跳转到登录
    func toLogin() {
        toMain()
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name("EVENT_LOGIN_CLICK"), object: nil)
        }
        
    }
    
    func setRootViewController(_ data: UIViewController) {
        window!.rootViewController = data
    }
}

