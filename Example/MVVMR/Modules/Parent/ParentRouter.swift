//
//  ParentRouter.swift
//  MVVMR_Example
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI
import MVVMR

final class ParentRouter: RouterProtocol {
    typealias ViewModel = ParentViewModel

    enum Route {
        case child
    }

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
extension ParentRouter {
    func destination() -> AnyView {
        switch state {
        case .child:
            let router = ChildRouter.createModule(parent: self)
            self.child = router
            return router.destination()
        case .none:
            return AnyView(ParentView(viewModel: self.viewModel))
        }
    }
}

// MARK: Factory
extension ParentRouter {
    static func createModule(parent: RouterDelegate? = nil) -> Self {
        let viewModel = ViewModel()
        let router = Self(parent: parent, viewModel: viewModel)
        viewModel.inject(router: router)
        return router
    }
}
