//
//  TreinoViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {
    @Published var mainModel:[MainModel] = []
    @Published var trainingName:String = ""
    @Published var trainingDescription:String = ""

    
    init() {
        self.mainModel = [MainModel(id: "0", name: "Yoda", description: "", suggestedTraining: false),
                          MainModel(id: "1", name: "Ahsoka", description: "", suggestedTraining: true),
                          MainModel(id: "2", name: "Anakin", description: "", suggestedTraining: false)]
  
        
    }
    
    func addTraining(_ task: MainModel){
        self.mainModel.insert(task, at: 0)
        }
    
    func removeTraining(at offsets: IndexSet){
        self.mainModel.remove(atOffsets: offsets)
    }
 
    
}
