//
//  WeekTrainingViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 29/11/21.
//

import Foundation
import Combine
import UIKit
import FirebaseAuth


class WeekTrainingViewModel: ObservableObject {
    @Published var weekTrainingRepository = WeekTrainingRepository()
    @Published var weekTraining:[WeekTraining] = []
    @Published var filteredArray:[WeekTraining] = []
    @Published var daysOfWeek:[DaysOfWeek] = []
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

        
        self.initialWeekTraining = WeekTraining(id: "",
                                                userId: "",
                                                trainingName: "",
                                                trainingId: "",
                                                sunday: false,
                                                monday: false,
                                                twesday: false,
                                                wednesday: false,
                                                thursday: false,
                                                friday: false,
                                                saturday: false,
                                                sundayDay: "",
                                                mondayDay: "",
                                                twesdayDay: "",
                                                wednesdayDay: "",
                                                thursdayDay: "",
                                                fridayDay: "",
                                                saturdayDay: ""
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
    
    func removeDayTraining(at offsets: IndexSet){
        self.filteredArray.remove(atOffsets: offsets)
    }
 
    
}
