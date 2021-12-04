//
//  Exercicio.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 25/11/21.
//

import SwiftUI


protocol Exercise {
    var nome: String { get set }
}

struct ExerciseModel: Exercise, Identifiable {
    var nome:String
    var id:String = UUID().uuidString
    var observacoes:String
    var trainingId:String? 
}

struct ExerciseImagesModel: Exercise, Identifiable {
    var nome: String
    var id:String = UUID().uuidString
    var image:String
}


