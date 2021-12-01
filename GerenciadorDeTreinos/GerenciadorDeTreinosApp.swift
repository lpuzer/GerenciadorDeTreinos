//
//  GerenciadorDeTreinosApp.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import SwiftUI
import Firebase
import FirebaseAuth


@main
struct GerenciadorDeTreinosApp: App {
    
    init() {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
    }
    

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


