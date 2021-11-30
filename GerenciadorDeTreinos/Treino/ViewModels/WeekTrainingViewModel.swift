//
//  WeekTrainingViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 29/11/21.
//

import Foundation


class WeekTrainingViewModel: ObservableObject {
    
    @Published var weekTraining:[WeekTraining] = []
    @Published var filteredArray:[WeekTraining] = []
    var diasDaSemana = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"]
    
    init() {
        getTraining()
        showTrainingList()
    }
    
    
    func showTrainingList(){
        filteredArray = weekTraining.filter({ days -> Bool in
            return (days.dayOfWeek.contains("Dom") || days.dayOfWeek.contains("Seg") ||
                    days.dayOfWeek.contains("Ter") || days.dayOfWeek.contains("Qua") ||
                    days.dayOfWeek.contains("Qui") || days.dayOfWeek.contains("Sex") ||
                    days.dayOfWeek.contains("Sab"))
        })
    }
    
    
    
    func getTraining() {
        let training1 = WeekTraining(dayOfWeek: ["Seg", "Ter"], trainingName: "Joelho", isTrainingCompleted: true)
        let training2 = WeekTraining(dayOfWeek: ["Ter", "Qua"], trainingName: "braço", isTrainingCompleted: false)
        let training3 = WeekTraining(dayOfWeek: ["Qua", "Sab"], trainingName: "Joelho", isTrainingCompleted: true)
        let training4 = WeekTraining(dayOfWeek: ["Qui", "Qua", "Sex"], trainingName: "braço", isTrainingCompleted: false)
        let training5 =  WeekTraining(dayOfWeek: ["Sex", "Dom"], trainingName: "perna", isTrainingCompleted: false)
        let training6 =  WeekTraining(dayOfWeek: ["Sab"], trainingName: "tudo", isTrainingCompleted: false)
        let training7 =  WeekTraining(dayOfWeek: ["Dom"], trainingName: "corrida", isTrainingCompleted: false)
        
        self.weekTraining.append(contentsOf: [
            training1,
            training2,
            training3,
            training4,
            training5,
            training6,
            training7,
        ])
    }
    
}
