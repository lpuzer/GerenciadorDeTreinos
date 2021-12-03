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
                    ForEach(weekTrainingViewModel.filteredArray) {treino in
                        NavigationLink(destination: ExerciseView()) {
                            if treino.dayOfWeek.contains(day){
                                Text(treino.trainingName)
                                    .font(.title3)
                                    .frame(width: 100, height: 50)
                                    .cornerRadius(50)
                                    .foregroundColor(Color.black)
                                    .padding(.bottom, 30)
                                    .onTapGesture {
                                        self.weekTrainingViewModel.showActionWeekSheet.toggle()
                                    }
                                    .actionSheet(isPresented: $weekTrainingViewModel.showActionWeekSheet) {
                                        ActionSheet(title: Text("Selecione uma Opção"), message: nil
                                                    , buttons: [
                                                        .destructive(Text("Excluir"), action: {
   
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
