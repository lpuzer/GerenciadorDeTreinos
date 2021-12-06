//
//  File.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 29/11/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct WeekTraining: Identifiable, Codable {
    @DocumentID var id: String?
    var userId:String?
    var trainingName:String
    var trainingId:String?
    var selectedDay:String
    var isSelectedDay:Bool

    
}


struct DaysOfWeek: Identifiable {
    var id:String = UUID().uuidString
    var day:String
    var isSelected: Bool = false
}
