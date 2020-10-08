//
//  AppDelegate.swift
//  CopotentialDemo
//
//  Created by Vivek Patel on 08/10/20.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    @Published var email = ""
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
