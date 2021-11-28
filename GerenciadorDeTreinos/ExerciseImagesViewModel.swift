//
//  ImagensDosExerciciosViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 26/11/21.
//

import SwiftUI

final class ExerciseImagesViewModel: ObservableObject {
    @Published var imagensDosExerciciosModel: [ExerciseImagesModel] = []
    
    init () {
        imagensDosExerciciosModel = [ExerciseImagesModel(nome: "Exercicio 10", id: "10", image: "person.fill"),
                                     ExerciseImagesModel(nome: "Exercicio 11", id: "11", image: "person"),
                                     ExerciseImagesModel(nome: "Exercicio 12", id: "12", image: "person.circle.fill")]
    }
    
    
    func addExercicio(_ task: ExerciseImagesModel){
        self.imagensDosExerciciosModel.insert(task, at: 0)
        }
    
    
    func removeExercicio(at offsets: IndexSet){
        self.imagensDosExerciciosModel.remove(atOffsets: offsets)
    }
    
    
}
