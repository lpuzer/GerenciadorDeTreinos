//
//  ExercicioViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 26/11/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import Combine

final class ExerciseViewModel: ObservableObject {
    @Published var exercicioModel:[ExerciseModel] = []
    
    init () {
        exercicioModel = [ExerciseModel(nome: "Exercicio0", id: "0", observacoes: "descrição do exercicio 0"),
                          ExerciseModel(nome: "Exercicio1", id: "1", observacoes: "descrição do exercicio 1"),
                          ExerciseModel(nome: "Exercicio2", id: "2", observacoes: "descrição do exercicio 2")]
    }
    
    
    func addExercicio(_ task: ExerciseModel){
        self.exercicioModel.insert(task, at: 0)
        }
    
    
    func removeExercicio(at offsets: IndexSet){
        self.exercicioModel.remove(atOffsets: offsets)
    }
    
    
}
