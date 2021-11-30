//
//  WeekTrainingViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 29/11/21.
//

import Foundation
import Combine


class WeekTrainingViewModel: ObservableObject {
    
    @Published var weekTraining:[WeekTraining] = []
    @Published var filteredArray:[WeekTraining] = []
    @Published var daysOfWeek:[DaysOfWeek] = []
    @Published var filteredDayArray:[String] = []
    
    init() {
        self.daysOfWeek = [DaysOfWeek(day: "Dom"),
                           DaysOfWeek(day: "Seg"),
                           DaysOfWeek(day: "Ter"),
                           DaysOfWeek(day: "Qua"),
                           DaysOfWeek(day: "Qui"),
                           DaysOfWeek(day: "Sex"),
                           DaysOfWeek(day: "Sab"),
        ]
        showDaysOfWeek()
        
        self.weekTraining = weekTraining
        showTrainingList()
        
    }
    
    
    func showDaysOfWeek(){
        filteredDayArray = daysOfWeek.compactMap({$0.day})
    }
    

    func showTrainingList(){
        filteredArray = weekTraining.filter({ days -> Bool in
            return (days.dayOfWeek.contains("Dom") || days.dayOfWeek.contains("Seg") ||
                    days.dayOfWeek.contains("Ter") || days.dayOfWeek.contains("Qua") ||
                    days.dayOfWeek.contains("Qui") || days.dayOfWeek.contains("Sex") ||
                    days.dayOfWeek.contains("Sab"))
        })
    }
    

    
    
    func addDayTraining(_ task: WeekTraining){
        self.filteredArray.insert(task, at: 0)
        }
    
    func removeDayTraining(at offsets: IndexSet){
        self.filteredArray.remove(atOffsets: offsets)
    }
 
    
    
}
