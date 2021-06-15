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
    var child: Renderable?
    
    @Published var current: Route = .root
    @Published var openedURL: URL?
    @Published var modalContent: AnyView?
    @Published var isModalPresented: Bool = false

    init() {
        child = createModule(for: current, parent: self)
    }

    func createModule(for route: Route, parent: RouterDelegate) -> Renderable? {
        switch current {
        case .root:
            return ParentRouter.createModule(parent: parent)
        }
    }

    func destination() -> AnyView {
        child?.destination().embedInNavigationView()
            ?? AnyView(EmptyView())
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
