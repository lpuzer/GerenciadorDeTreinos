//
//  SubTreinoViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 25/11/21.
//

import SwiftUI

final class TrainingListViewModel: ObservableObject {
    @Published var subTrainingModel:[TrainingListModel] = []
    
    init() {
        self.subTrainingModel = [
            TrainingListModel(id: "0", name: "Yoda", descricao: "primeiro", data: Date()),
            TrainingListModel(id: "1", name: "Ahsoka", descricao: "Segundo", data: Date()),
            TrainingListModel(id: "2", name: "Anakin", descricao: "Terceiro", data: Date())
        ]  
    }
    
    func addTraining(_ task: TrainingListModel){
        self.subTrainingModel.insert(task, at: 0)
        }
    
    func removeTraining(at offsets: IndexSet){
        self.subTrainingModel.remove(atOffsets: offsets)
    }
    
    
}
