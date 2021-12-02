//
//  LoginView.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 27/11/21.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
        VStack {
            Text("Obrigado por usar nosso aplicativo")
                .font(.title3)
            AppleLogin()
            GoogleLogin()
        }.padding()
    }
}
    

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


