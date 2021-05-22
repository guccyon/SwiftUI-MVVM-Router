//
//  ParentViewModel.swift
//  MVVMR_Example
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import MVVMR

final class ParentViewModel: ViewModelProtocol {
    typealias Router = ParentRouter
    weak var router: Router?
    @Published var presentState = PresentState(style: .none)

    init() {
        bind()
    }
}

// MARK: - Binding
extension ParentViewModel {
    func bind() {
    }
}

// MARK: - Dependency Injection
extension ParentViewModel {

    func inject(router: Router) {
        self.router = router
    }
}
