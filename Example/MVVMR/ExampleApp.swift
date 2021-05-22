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

    @StateObject var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            ZStack {
                router.destination()
            }
            .fullScreenCover(isPresented: $router.isModalPresented) {
                router.modalContent
            }
        }
    }
}
