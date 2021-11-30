//
//  TrainingListViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 30/11/21.
//

import Foundation
import Combine

final class TrainingListViewModel: ObservableObject {
    @Published var trainingListModel:[TrainingListModel] = []
    @Published var daysOfWeek:[DaysOfWeek] = []
    
    init() {
        self.trainingListModel = [
            TrainingListModel(id: "0", name: "Yoda", descricao: "primeiro", data: Date(), diaDaSemana: ["Seg", "Ter"]),
            TrainingListModel(id: "1", name: "Ahsoka", descricao: "Segundo", data: Date(), diaDaSemana: ["Qua", "Qui" ]),
            TrainingListModel(id: "2", name: "Anakin", descricao: "Terceiro", data: Date(), diaDaSemana: ["Sex", "Sab", "Dom"])
        ]
        
        self.daysOfWeek = [DaysOfWeek(day: "Dom"),
                           DaysOfWeek(day: "Seg"),
                           DaysOfWeek(day: "Ter"),
                           DaysOfWeek(day: "Qua"),
                           DaysOfWeek(day: "Qui"),
                           DaysOfWeek(day: "Sex"),
                           DaysOfWeek(day: "Sab"),
        ]
    }
    
    func addWeekTraining(_ task: [String]){
 
        }
    
    func removeTraining(at offsets: IndexSet){
        self.trainingListModel.remove(atOffsets: offsets)
    }
    
    
    
}
