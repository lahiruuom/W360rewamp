//
//  StartView.swift
//  home360
//
//  Created by Lahiru Manulanka Munasinghe on 2021-06-14.
//

import SwiftUI

struct StartView: View {
    
    @State private var navigationForTab_0_0_View = false
    @ObservedObject var viewModel: StartViewModel
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                if self.isActive {
                    NavigationLink(
                        destination: LoginView(viewModel: .init())
                            .navigationBarTitle("")
                            .navigationBarHidden(true),
                        isActive: .constant(true)
                    ) {
                        EmptyView()
                    }
                } else {
                    Image(Images.StartView.StartIcon.rawValue)
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .scaledToFit()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environment(\.rootPresentationMode, self.$isActive)
    }
}
