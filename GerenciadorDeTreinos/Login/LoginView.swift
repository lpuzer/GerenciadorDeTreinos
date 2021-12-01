//
//  LoginView.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 27/11/21.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var coordinator: SigInWithAppleCoordinator?
    var body: some View {
        VStack {
            Text("Obrigado por usar nosso aplicativo")
                .font(.title3)
            SignInWithAppleButton()
                .frame(width: 200, height: 54)
                .onTapGesture {
                    self.coordinator = SigInWithAppleCoordinator()
                    if let coordinator = coordinator {
                        coordinator.startSignInWithAppleFlow {
                            print("You successfully signed in")
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
