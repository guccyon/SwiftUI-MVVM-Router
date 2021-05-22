//
//  ChildRouter.swift
//  MVVMR_Example
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI
import MVVMR

final class ChildRouter: RouterProtocol {
    typealias ViewModel = ChildViewModel

    enum Route { }

    var parent: RouterDelegate?
    var child: Renderable?
    var viewModel: ViewModel
    var state: Route?

    init(parent: RouterDelegate?, viewModel: ViewModel) {
        self.parent = parent
        self.viewModel = viewModel
    }
}

// MARK: Renderer
extension ChildRouter {
    func destination() -> AnyView {
        switch state {
        case .none:
            return AnyView(ChildView(viewModel: self.viewModel))
        }
    }
}

// MARK: Factory
extension ChildRouter {
    static func createModule(parent: RouterDelegate? = nil) -> Self {
        let viewModel = ViewModel()
        let router = Self(parent: parent, viewModel: viewModel)
        viewModel.inject(router: router)
        return router
    }
}
