//
//  Router.swift
//  MVVMR
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//

import Foundation
import SwiftUI

public protocol RouterDelegate: class {
    var parent: RouterDelegate? { get }
    func open(_ url: URL)
    func dismiss()
    func presentModal(destination: () -> AnyView)
    func dismissModal()
}

public protocol Renderable {
    func destination() -> AnyView
}

public protocol RouterProtocol: Renderable, RouterDelegate {
    associatedtype Route
    associatedtype ViewModel: RoutableViewModel

    var state: Route? { get set }
    var viewModel: ViewModel { get set }
}


// MARK: Router delegate default
public extension RouterProtocol {
    func open(_ url: URL) {
        parent?.open(url)
    }

    func dismiss() {
        if state == nil {
            parent?.dismiss()
        } else {
            if viewModel.presentState.style == .modal {
                dismissModal()
            }
            state = nil
            viewModel.presentState = .init(style: .none)
        }
    }

    func presentModal(destination: () -> AnyView) {
        parent?.presentModal(destination: destination)
    }

    func dismissModal() {
        parent?.dismissModal()
    }
}

// MARK: Router default
extension RouterProtocol {
    func present(route: Route, style: PresentStyle = .push) {
        switch style {
        case .modal:
            self.state = route
            self.viewModel.presentState = .init(style: style)
            parent?.presentModal(destination: destination)
        default:
            self.state = route
            self.viewModel.presentState = .init(style: style)
        }
    }
}
