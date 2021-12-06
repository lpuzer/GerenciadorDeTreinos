//
//  WeekTrainingViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 29/11/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import Combine


class WeekTrainingViewModel: ObservableObject {
    @Published var weekTrainingRepository = WeekTrainingRepository()
    @Published var weekTraining:[WeekTraining] = []
    @Published var filteredArray:[WeekTraining] = []
    @Published var daysOfWeek:[DaysOfWeek] = []
    @Published var selectedDay:[String] = []
    @Published var filteredDayArray:[String] = []
    @Published var showActionWeekSheet: Bool = false
    @Published var showSheetWeekForm:Bool = false
    @Published var isDayWeekTraining:Bool = false
    @Published var initialWeekTraining:WeekTraining
    private var cancellables: Set<AnyCancellable> = []
    
    
    init() {
        self.daysOfWeek = [DaysOfWeek(day: "Dom"),
                           DaysOfWeek(day: "Seg"),
                           DaysOfWeek(day: "Ter"),
                           DaysOfWeek(day: "Qua"),
                           DaysOfWeek(day: "Qui"),
                           DaysOfWeek(day: "Sex"),
                           DaysOfWeek(day: "Sab"),
        ]
        
        
        self.selectedDay = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"]
        
        self.initialWeekTraining = WeekTraining(id: "",
                                                userId: "",
                                                trainingName: "",
                                                trainingId: "",
                                                selectedDay: "",
                                                isSelectedDay: false
        )
        
        
        
        weekTrainingRepository.$weekTraining
            .assign(to: \.weekTraining, on: self)
            .store(in: &cancellables)
        
        
        
        
    }
    
    
    func showDaysOfWeek(){
        filteredDayArray = daysOfWeek.compactMap({$0.day})
    }

    
    func addDayTraining(_ task: WeekTraining){
        weekTrainingRepository.addWeekTraining(task)
        }
    
    func removeTraining(_ task: WeekTraining){
        weekTrainingRepository.removeTraining(task)
    }
 
    
    func updateTraining(_ task: WeekTraining) {
        weekTrainingRepository.updateTraining(task)
    }
    
    
    
}
