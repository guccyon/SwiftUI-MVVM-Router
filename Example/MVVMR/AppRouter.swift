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

final class AppRouter: RouterDelegate {
    enum Route {
        case root
    }

    var parent: RouterDelegate?
    var child: Renderable?
    @Published var current: Route = .root

    @Published var openedURL: URL?
    @Published var modalContent: AnyView?

    func destination() -> AnyView {
        switch current {
        case .root:
            let router = ParentRouter.createModule(parent: self)
            self.child = router
            return router.destination().embedInNavigationView()
        }
    }

    func open(_ url: URL) {
        self.openedURL = url
    }

    func dismiss() {
    }

    func presentModal(destination: () -> AnyView) {
        modalContent = destination()
    }

    func dismissModal() {
        modalContent = nil
    }
}
