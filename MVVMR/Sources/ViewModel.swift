//
//  ViewModel.swift
//  MVVMR
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//

import Foundation
import SwiftUI

public protocol RoutableViewModel: class {
    associatedtype Router: RouterProtocol

    var router: Router? { get }
    var presentState: PresentState { get set }
    func inject(router: Router)
}

public protocol ViewModelProtocol: RoutableViewModel, ObservableObject {
}

extension RoutableViewModel {
    func dismissState() {
        router?.state = nil
        router?.child = nil
        presentState = .init(style: .none)
    }
}
