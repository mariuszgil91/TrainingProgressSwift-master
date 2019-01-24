//
//  AppDelegate.swift
//  TrainingProgress
//
//  Created by Mariusz Gil on 18/12/2018.
//  Copyright © 2018 Mariusz Gil. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // copy over old data files for migration
        let defaultURL = Realm.Configuration.defaultConfiguration.fileURL!
        //let defaultParentURL = defaultURL.deletingLastPathComponent()
        
        
        if let v0URL = bundleURL("MyBundledData") {
            do {
                //try FileManager.default.removeItem(at: defaultURL)
                try FileManager.default.copyItem(at: v0URL, to: defaultURL)
            } catch {}
        }
        
        
        return true
    }
    
    func bundleURL(_ name: String) -> URL? {
        return Bundle.main.url(forResource: "MyBundledData", withExtension: "realm")
    }
    
    #if !swift(>=4.2)
    extension UIApplication {
    typealias LaunchOptionsKey = UIApplicationLaunchOptionsKey
    }
    #endif

}

