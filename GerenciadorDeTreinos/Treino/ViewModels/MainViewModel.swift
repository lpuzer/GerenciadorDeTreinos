//
//  TreinoViewModel.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    @Published var mainModel:[MainModel] = []
    @Published var trainingName:String = ""
    @Published var trainingDescription:String = ""
    @Published var showActionSheet: Bool = false
    @Published var showSheetMainForm:Bool = false
    @Published var showSheetForm:Bool = false
    @Published var isDayTraining:Bool = false

    
    init() {
        self.mainModel = mainModel
  
        
    }
    
    func addTraining(_ task: MainModel){
        self.mainModel.insert(task, at: 0)
        }
    
    func removeTraining(at offsets: IndexSet){
        self.mainModel.remove(atOffsets: offsets)
    }
 
    
}

