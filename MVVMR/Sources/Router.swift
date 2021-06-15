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
    func presentModal<Content: View>(modalContent: Content)
    func dismissModal()
}

public protocol Renderable {
    func destination() -> AnyView
    func renderer() -> Renderable
}

public protocol RouterProtocol: Renderable, RouterDelegate {
    associatedtype Route
    associatedtype ViewModel: RoutableViewModel

    var state: Route? { get set }
    var child: Renderable? { get set }
    var viewModel: ViewModel { get set }

    func createModule(for route: Route) -> Renderable?
    func present(route: Route, style: PresentStyle)
    func open(_ url: URL)
    func dismiss()
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
            child = nil
            viewModel.presentState = .init(style: .none)
        }
    }

    func presentModal<Content: View>(modalContent: Content) {
        parent?.presentModal(modalContent: modalContent)
    }

    func dismissModal() {
        parent?.dismissModal()
    }

    func renderer() -> Renderable {
        if let child = child {
            return child
        }

        if let state = state {
            child = createModule(for: state)
        }

        return child ?? self
    }
}

// MARK: Router default
public extension RouterProtocol {
    func present(route: Route, style: PresentStyle = .push) {
        switch style {
        case .modal:
            self.state = route
            self.viewModel.presentState = .init(style: style)
            parent?.presentModal(modalContent: renderer().destination())
        default:
            self.state = route
            self.viewModel.presentState = .init(style: style)
        }
    }
}
