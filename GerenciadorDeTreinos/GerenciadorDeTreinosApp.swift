//
//  GerenciadorDeTreinosApp.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import SwiftUI


@main
struct GerenciadorDeTreinosApp: App {


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
