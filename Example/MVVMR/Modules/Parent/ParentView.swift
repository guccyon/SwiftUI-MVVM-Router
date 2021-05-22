//
//  ParentView.swift
//  MVVMR_Example
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

struct ParentView: View {
    @StateObject var viewModel: ParentViewModel

    var body: some View {
        VStack(spacing: 15) {
            Text("ParentView")

            Button("Show ChildView") {
                viewModel.presentChild()
            }
            
            Button("Show ChildView as modal") {
                viewModel.presentChildAsModal()
            }
        }
        .navigation(viewModel: viewModel)
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView(viewModel: .init())
    }
}
