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

            Button("Show ChildView as sheet") {
                viewModel.presentChildAsSheet()
            }
        }
        .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
        .background(Color.yellow)
        .navigationBarTitle("Parent", displayMode: .inline)
        .navigation(viewModel: viewModel)
        .sheet(viewModel: viewModel)
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView(viewModel: .init())
    }
}
