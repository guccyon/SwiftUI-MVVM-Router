//
//  ChildViewModel.swift
//  MVVMR_Example
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import MVVMR

final class ChildViewModel: ViewModelProtocol {
    typealias Router = ChildRouter
    weak var router: Router?
    @Published var presentState = PresentState(style: .none)

    init() {
        bind()
    }
}

// MARK: - Binding
extension ChildViewModel {
    func bind() {
    }
}

// MARK: - Dependency Injection
extension ChildViewModel {
    func inject(router: Router) {
        self.router = router
    }
}
