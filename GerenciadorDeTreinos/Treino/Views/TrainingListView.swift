//
//  TreinoView.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 25/11/21.
//

import SwiftUI

struct TrainingListView: View {
    @EnvironmentObject var subTreinoViewModel: TrainingListViewModel
    @EnvironmentObject var mainTreinoViewModel: MainViewModel
      
    init() {
        UITableView.appearance().backgroundColor = .init(named: "ListTreinoViewBackground")
    }
    
    var body: some View {
            ZStack {
                VStack (alignment: .leading){
                        List() {
                            ForEach(subTreinoViewModel.subTrainingModel) { treino in
                                NavigationLink(destination: ExerciseView()) {
                                HStack (alignment: .top) {
                                    Spacer()
                                    VStack {
                                        ZStack {
                                            Text(treino.formatDay()).font(.title3)
                                        }
                                        Image(systemName: "arrow.down")
                                            .resizable()
                                            .frame(width: 10, height: 50)
                                    }
                                    Spacer()
                                    VStack (alignment: .leading, spacing: 5){
                                        HStack () {
                                            Group{
                                        Text(treino.name)
                                        Text(treino.descricao)
                                            }.font(.title3)
                                        }
                                        Text(treino.formatDate())
                                            .font(.caption)
                                    }.padding(.bottom, 20)
                                    Spacer()
                                }
                            }
                            }.listRowSeparator(.hidden)
                        }.frame(width: 400, height: 600)
                            .cornerRadius(30)
                            .offset(x: 0, y: 40)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color("mainBackground")
                        .ignoresSafeArea()
            }

            
        }
    
   
    
    }


struct TreinoView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingListView()
            .environmentObject(MainViewModel())
            .environmentObject(TrainingListViewModel())
    }
}
