//
//  TreinoViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class MainViewModel: ObservableObject {
    @Published var mainModel:[MainModel] = []
    @Published var trainingRepository = TrainingRepository()
    @Published var showSheetMainForm:Bool = false
    @Published var showSheetForm:Bool = false
    @Published var isDayTraining:Bool = false
    @Published var initialMainTraining:MainModel
    @Published var editableDoc:Bool = false
    private var cancellables: Set<AnyCancellable> = []
    

    
    init() {
        self.initialMainTraining = MainModel(id: "", name: "", description: "", suggestedTraining: false, userId: "")
        
        
        trainingRepository.$mainModel
            .assign(to: \.mainModel, on: self)
            .store(in: &cancellables)
  
        
    }
    
    func addTraining(_ task: MainModel){
        trainingRepository.addTraining(task)
        }
    
    func removeTraining(_ task: MainModel){
        trainingRepository.removeTraining(task)
    }
 
    
    func updateTraining(_ task: MainModel) {
        trainingRepository.updateTraining(task)
    }
    
}

