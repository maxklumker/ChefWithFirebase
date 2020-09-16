//
//  Chef_V2App.swift
//  Chef V2
//
//  Created by Lewis Wall on 10.09.20.
//

import SwiftUI
import UIKit
import Firebase


@main
struct Chef_V2App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject,UIApplicationDelegate{

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?=nil) -> Bool {
    FirebaseApp.configure()
    
    let db=Firestore.firestore()
    
    return true
  }
}
