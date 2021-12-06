//
//  AppleLogin.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 01/12/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import Combine

struct AppleLogin: View {
    @Environment(\.presentationMode) var presentationMode
    @State var coordinator: SigInWithAppleCoordinator?
    var body: some View {
        VStack {
            SignInWithAppleButton()
                .frame(width: 350, height: 60)
                .cornerRadius(40)
                .aspectRatio(contentMode: .fit)
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

struct AppleLogin_Previews: PreviewProvider {
    static var previews: some View {
        AppleLogin()
    }
}
