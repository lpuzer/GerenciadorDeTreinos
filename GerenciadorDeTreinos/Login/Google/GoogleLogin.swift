//
//  GoogleLogin.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 02/12/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import Combine
import GoogleSignIn

struct GoogleLogin: View {
    var body: some View {
        
        ZStack{
            VStack{
                HStack {
                    Button(action: {
                        handledLogin()
                    }) {
                        Image("google")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                        Text("Sing In with Google")
                            .font(.title2)
                            .fontWeight(.medium)
                            .kerning(1.1)
                    }.foregroundColor(Color.blue)
                        .padding()
                        .frame(width: 350, height: 60)
                        .background(
                            Capsule()
                                .strokeBorder(Color.blue, lineWidth: 2)
                        )
                }.padding()
            }
        }
    }
    
    func handledLogin(){
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController())
        {[self] user, err in
            
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, err in
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else{
                    return
                }
            }
            
        }
        
    }
    
}
    


struct GoogleLogin_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLogin()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
}
