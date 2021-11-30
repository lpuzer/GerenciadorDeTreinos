//
//  File.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 29/11/21.
//

import Foundation

struct WeekTraining: Identifiable {
    var id:String = UUID().uuidString
    var dayOfWeek:[String]
    var trainingName:String
    var isTrainingCompleted:Bool
    
}


struct DaysOfWeek: Identifiable {
    var id:String = UUID().uuidString
    var day:String
    var isSelected: Bool = false
}
