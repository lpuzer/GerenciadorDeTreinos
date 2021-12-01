//
//  TreinoViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import Foundation
import Combine
import Firebase

final class MainViewModel: ObservableObject {
    @Published var mainModel:[MainModel] = []
    @Published var trainingRepository = TrainingRepository()
    @Published var trainingName:String = ""
    @Published var trainingDescription:String = ""
    @Published var showActionSheet: Bool = false
    @Published var showSheetMainForm:Bool = false
    @Published var showSheetForm:Bool = false
    @Published var isDayTraining:Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    

    
    init() {
        self.mainModel = mainModel
        
        trainingRepository.$mainModel
            .assign(to: \.mainModel, on: self)
            .store(in: &cancellables)
  
        
    }
    
    func addTraining(_ task: MainModel){
        trainingRepository.addTraining(task)
      //  self.mainModel.insert(task, at: 0)
        }
    
    func removeTraining(_ task: MainModel){
        trainingRepository.removeTraining(task)
      //  self.mainModel.remove(atOffsets: offsets)
    }
 
    
    func updateTraining(_ task: MainModel) {
        trainingRepository.updateTraining(task)
    }
    
}

