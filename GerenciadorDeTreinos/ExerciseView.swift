//
//  ExercicioView.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 25/11/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import Combine

struct ExerciseView: View {
    @EnvironmentObject var exercicioViewModel: ExerciseViewModel
    @EnvironmentObject var imagensDosExerciciosViewModel: ExerciseImagesViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .init(named: "ListTreinoViewBackground")
    }
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                ScrollView() {
                    HStack {
                        Spacer()
                        VStack {
                            ForEach(imagensDosExerciciosViewModel.imagensDosExerciciosModel) { exercicios in
                                VStack (alignment: .center) {
                                    Image(systemName: exercicios.image)
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                    Image(systemName: "arrow.down")
                                        .resizable()
                                        .frame(width: 20, height: 60)
                                }.frame(width: 60, height: 180)
                            }
                        }
                        Spacer()
                        VStack {
                            ForEach(exercicioViewModel.exercicioModel) { treino in
                                VStack (alignment: .leading, spacing: 5){
                                    HStack () {
                                        Group{
                                            Text("Treino")
                                            Text("descricao")
                                        }.font(.title3)
                                    }
                                    Text("\(Date())").font(.title3)
                                        .font(.caption)
                                }.frame(width: 200, height: 180)
                            }
                        
                        Spacer()
                    }
                    }
                }.frame(width: 300, height: 600)
                    .cornerRadius(30)
                    .offset(x: 0, y: 40)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color("mainBackground")
                    .ignoresSafeArea()
            }
    }
}

struct ExercicioView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
            .environmentObject(ExerciseImagesViewModel())
            .environmentObject(ExerciseViewModel())
    }
}
