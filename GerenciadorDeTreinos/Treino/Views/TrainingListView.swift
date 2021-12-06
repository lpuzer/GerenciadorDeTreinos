//
//  TreinoView.swift
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

struct TrainingListView: View {
    @EnvironmentObject var weekTrainingViewModel: WeekTrainingViewModel
    @EnvironmentObject var mainViewModel: MainViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .init(named: "ListTreinoViewBackground")
    }
    
    var body: some View {
        ZStack {
            VStack {
                 VStack (alignment: .leading){
                    TrainingWeekCellView(days: "Dom")
                    TrainingWeekCellView(days: "Seg")
                    TrainingWeekCellView(days: "Ter")
                    TrainingWeekCellView(days: "Qua")
                    TrainingWeekCellView(days: "Qui")
                    TrainingWeekCellView(days: "Sex")
                    TrainingWeekCellView(days: "Sab")
                }
                Button(action:  {
                    self.weekTrainingViewModel.initialWeekTraining.trainingName = ""
                    self.weekTrainingViewModel.initialWeekTraining.selectedDay = ""
                    self.weekTrainingViewModel.initialWeekTraining.isSelectedDay = false
                    self.mainViewModel.showSheetForm.toggle()
                } ) {
                    TopBarMenu(buttonBarWidth: 50.0, buttonBarHeight: 50.0, buttonBarColor: .orange)
                }.sheet(isPresented: $mainViewModel.showSheetForm) {
                    AddIndividualTraining()
                }
            }.frame(alignment: .topLeading)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background {
            Color("mainBackground")
                .ignoresSafeArea()
        }
    }
}


struct TrainingListView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingListView()
            .environmentObject(MainViewModel())
            .environmentObject(WeekTrainingViewModel())
    }
}




struct TrainingWeekCellView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var weekTrainingViewModel: WeekTrainingViewModel
    @State var selecTraining:WeekTraining?
    @State var showDeleteTrainingSheet:Bool = false
    var days:String
    
    var body: some View {
        HStack {
            Text(days)
                .modifier(weekDaysBorder())
            ScrollView (.horizontal, showsIndicators: false){
                HStack (alignment: .center){
                    ForEach(weekTrainingViewModel.weekTraining) {treino in
                        NavigationLink(destination: ExerciseView()) {
                            if ((   treino.selectedDay == days
                                ) && treino.trainingId == mainViewModel.initialMainTraining.id)  {

                                Text(treino.trainingName)
                                    .modifier(weekTrainingBorder())
                                    .padding(5)
                                    .onTapGesture {
                                        self.selecTraining = treino
                                        self.showDeleteTrainingSheet.toggle()
                                        
                                    }
                                    .actionSheet(isPresented: $showDeleteTrainingSheet) {
                                        ActionSheet(title: Text("Selecione uma Opção"), message: nil
                                                    , buttons: [
                                                        .destructive(Text("Excluir"),
                                                            action: {
                                                            if let selecTraining = self.selecTraining {
                                                                if selecTraining.isSelectedDay == true {
                                                                    self.deleteTreino(weekTraining: selecTraining)
                                                                }
                                                            }  

                                                        }),
                                                        .cancel()
                                                    ])
                                    }
                            
                            }
                            
                        }
                    }
                }
            }
            
        }.frame(width: 350, height: 60, alignment: .top)
    }
    func deleteTreino(weekTraining: WeekTraining) {
        weekTrainingViewModel.removeTraining(weekTraining)
    }
}
