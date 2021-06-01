//
//  AppRouter.swift
//  MVVMR_Example
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI
import MVVMR

final class AppRouter: RouterDelegate, ObservableObject {
    enum Route {
        case root
    }

    var parent: RouterDelegate?
    
    @Published var current: Route = .root
    @Published var openedURL: URL?
    @Published var modalContent: AnyView?
    @Published var isModalPresented: Bool = false

    func destination() -> AnyView {
        switch current {
        case .root:
            let router = ParentRouter.createModule(parent: self)
            return router.destination().embedInNavigationView()
        }
    }

    func open(_ url: URL) {
        self.openedURL = url
    }

    func dismiss() {
    }

    func presentModal<Content: View>(modalContent: Content) {
        self.modalContent = AnyView(modalContent)
        isModalPresented = true
    }

    func dismissModal() {
        modalContent = nil
        isModalPresented = false
    }
}
