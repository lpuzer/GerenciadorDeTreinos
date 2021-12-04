//
//  TreinoView.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 25/11/21.
//

import SwiftUI

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
                    TrainingWeekCellView(day: "Dom")
                    TrainingWeekCellView(day: "Seg")
                    TrainingWeekCellView(day: "Ter")
                    TrainingWeekCellView(day: "Qua")
                    TrainingWeekCellView(day: "Qui")
                    TrainingWeekCellView(day: "Sex")
                    TrainingWeekCellView(day: "Sab")
                }
                Button(action:  {
                    
                    self.weekTrainingViewModel.initialWeekTraining.trainingName = ""
                    self.weekTrainingViewModel.initialWeekTraining.sunday = false
                    self.weekTrainingViewModel.initialWeekTraining.monday = false
                    self.weekTrainingViewModel.initialWeekTraining.twesday = false
                    self.weekTrainingViewModel.initialWeekTraining.wednesday = false
                    self.weekTrainingViewModel.initialWeekTraining.thursday = false
                    self.weekTrainingViewModel.initialWeekTraining.friday = false
                    self.weekTrainingViewModel.initialWeekTraining.saturday = false

                    mainViewModel.showSheetForm.toggle()
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
    var day:String
    
    var body: some View {
        HStack {
            Text(day)
                .modifier(weekDaysBorder())
            ScrollView (.horizontal, showsIndicators: false){
                HStack (alignment: .center){
                    ForEach(weekTrainingViewModel.weekTraining) {treino in
                        NavigationLink(destination: ExerciseView()) {
                            if (    treino.sundayDay == day
                                ||  treino.mondayDay == day
                                ||  treino.twesdayDay == day
                                ||  treino.wednesdayDay == day
                                ||  treino.thursdayDay == day
                                ||  treino.fridayDay == day
                                ||  treino.saturdayDay == day
                                ) && treino.trainingId == mainViewModel.initialMainTraining.id  {

                                Text(treino.trainingName)
                                    .modifier(weekTrainingBorder())
                                    .padding(5)
                                    .onTapGesture {
                                        self.weekTrainingViewModel.showActionWeekSheet.toggle()
                                    }
                                    .actionSheet(isPresented: $weekTrainingViewModel.showActionWeekSheet) {
                                        ActionSheet(title: Text("Selecione uma Opção"), message: nil
                                                    , buttons: [
                                                        .destructive(Text("Excluir"), action: {
   
                                                            
                                                            if (!treino.sunday && !treino.monday && !treino.twesday && !treino.wednesday && !treino.thursday && !treino.friday && !treino.saturday){
                                                            
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
            
        }.frame(width: 300, height: 60, alignment: .top)
    }

    func deleteWeek(weekTraining: WeekTraining) {
        if let index = self.weekTrainingViewModel.filteredArray.firstIndex(where: { $0.id == weekTraining.id }) {
            self.weekTrainingViewModel.filteredArray.remove(at: index)
        }
    }
}
