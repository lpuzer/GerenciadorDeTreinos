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
    var sunday:Bool
    var monday:Bool
    var twesday:Bool
    var wednesday:Bool
    var thursday:Bool
    var friday:Bool
    var saturday:Bool
    var sundayDay:String?
    var mondayDay:String?
    var twesdayDay:String?
    var wednesdayDay:String?
    var thursdayDay:String?
    var fridayDay:String?
    var saturdayDay:String?

    
}


struct DaysOfWeek: Identifiable {
    var id:String = UUID().uuidString
    var day:String
    var isSelected: Bool = false
}
