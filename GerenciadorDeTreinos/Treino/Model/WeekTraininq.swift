//
//  File.swift
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
