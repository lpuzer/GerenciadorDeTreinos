//
//  Treino.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 24/11/21.
//

import Foundation

protocol TrainingProtocol {
    var name: String { get set }
}


struct MainModel: TrainingProtocol, Identifiable {
    var id:String = UUID().uuidString
    var name: String
    var description:String
    var suggestedTraining:Bool
}


struct TrainingListModel: TrainingProtocol, Identifiable {
    var id:String = UUID().uuidString
    var name: String
    var descricao:String
    var data:Date
    var diaDaSemana:[String]
    }

struct DaysOfWeek: Identifiable {
    var id:String = UUID().uuidString
    var day:String
    var isSelected: Bool = false
}



struct DayTraining: TrainingProtocol, Identifiable {
    var id:String = UUID().uuidString
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
