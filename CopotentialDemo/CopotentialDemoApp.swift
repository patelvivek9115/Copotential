//
//  CopotentialDemoApp.swift
//  CopotentialDemo
//
//  Created by Vivek Patel on 30/09/20.
//

import SwiftUI
import Firebase

@main
struct CopotentialDemoApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LoginView(info: self.delegate)
        }
    }
}
