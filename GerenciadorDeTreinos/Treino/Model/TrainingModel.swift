//
//  Treino.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol TrainingProtocol {
    var name: String { get set }
}


struct MainModel: TrainingProtocol, Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description:String
    var suggestedTraining:Bool
}


struct TrainingListModel: TrainingProtocol, Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var descricao:String
    var data:Date
    var diaDaSemana:[String]
    }

struct DayTraining: TrainingProtocol, Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
}


extension TrainingListModel {
        func formatDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("YYYY, MMM d")
            return dateFormatter.string(from: Date())
        }
}

extension TrainingListModel {
        func formatDay() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("EEE")
            return dateFormatter.string(from: Date())
        }
}
