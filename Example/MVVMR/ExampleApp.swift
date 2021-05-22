//
//  ExampleApp.swift
//  MVVMR_Example
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

@main
struct ExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    let router = AppRouter()

    var body: some Scene {
        WindowGroup {
            router.destination()
        }
    }
}
