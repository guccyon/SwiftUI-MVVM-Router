//
//  PresentStyle.swift
//  MVVMR
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//

import Foundation

public enum PresentStyle {
    case none
    case push
    case modal
    case sheet
}

public struct PresentState {
    var style: PresentStyle

    public init(style: PresentStyle) {
        self.style = style
    }
}
