//
//  NavigationContainer.swift
//  MVVMR
//
//  Created by Tetsuro Higuchi on 2021/05/22.
//

import SwiftUI

struct Navigation<Destination: View>: ViewModifier {
    @Binding var isActive: Bool
    var destination: () -> Destination

    func body(content: Content) -> some View {
        VStack {
            content

            NavigationLink(
                destination: destination(),
                isActive: $isActive) {
                EmptyView()
            }
        }
    }
}

struct EmbedInNavigationView: ViewModifier {
    func body(content: Content) -> some View {
        NavigationView {
            content
        }
    }
}

public extension View {
    func navigation<VM: RoutableViewModel>(viewModel: VM) -> some View {
        let isActive = Binding(
            get: { viewModel.presentState.style == .push },
            set: { value in
                if !value {
                    viewModel.dismissState()
                }
            }
        )

        let container = Navigation(
            isActive: isActive,
            destination: { viewModel.router?.renderer().destination() }
        )

        return modifier(container)
    }

    func sheet<VM: RoutableViewModel>(viewModel: VM) -> some View {
        let isPresented = Binding(
            get: { viewModel.presentState.style == .sheet },
            set: { value in
                if !value {
                    viewModel.dismissState()
                }
            }
        )
        return self.sheet(isPresented: isPresented) {
            viewModel.router?.renderer().destination()
        }
    }
    
    func embedInNavigationView() -> AnyView {
        AnyView(modifier(EmbedInNavigationView()))
    }
}
