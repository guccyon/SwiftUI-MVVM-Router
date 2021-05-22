//
//  ChildView.swift
//  MVVMR_Example
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SwiftUI

struct ChildView: View {
    @StateObject var viewModel: ChildViewModel
    
    var body: some View {
        Text("Child View")
            .navigationBarTitle("ChildView", displayMode: .inline)
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView(viewModel: .init())
            .embedInNavigationView()
    }
}
