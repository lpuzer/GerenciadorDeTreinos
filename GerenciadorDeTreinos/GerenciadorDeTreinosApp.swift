//
//  GerenciadorDeTreinosApp.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn



@main
struct GerenciadorDeTreinosApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            PageController()
                .environmentObject(MainViewModel())
                .environmentObject(ExerciseImagesViewModel())
                .environmentObject(ExerciseViewModel())
                .environmentObject(WeekTrainingViewModel())
       
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
        return true
    }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
    
}




