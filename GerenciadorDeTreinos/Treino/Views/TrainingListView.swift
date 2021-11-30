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
    @State var showSheetForm:Bool = false
    var weekDays:[String] = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab", ]

    @State var isDayTraining:Bool = false
    
    
    init() {
        UITableView.appearance().backgroundColor = .init(named: "ListTreinoViewBackground")
    }
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                Button(action:  {
                    showSheetForm.toggle()
                } ) {
                    TopBarMenu()
                }.sheet(isPresented: $showSheetForm) {
                    AddIndividualTraining()
                }
                Spacer()
                VStack (alignment: .leading){
                    Spacer()
                    TrainingWeekCellView(day: "Dom")
                    TrainingWeekCellView(day: "Seg")
                    TrainingWeekCellView(day: "Ter")
                    TrainingWeekCellView(day: "Qua")
                    TrainingWeekCellView(day: "Qui")
                    TrainingWeekCellView(day: "Sex")
                    TrainingWeekCellView(day: "Sab")
                }
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color("mainBackground")
                .ignoresSafeArea()
        }
    }
    private func showTraining(weekTraining:WeekTraining) -> Bool {
        return false
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
    @EnvironmentObject var weekTrainingViewModel: WeekTrainingViewModel
    var day:String
    
    var body: some View {
        HStack {
            Text(day)
                .modifier(weekDaysBorder())
            ScrollView (.horizontal, showsIndicators: false){
                HStack (alignment: .center){
                    ForEach(weekTrainingViewModel.filteredArray) {treino in
                        if treino.dayOfWeek.contains(day){
                        Text(treino.trainingName)
                            .font(.title3)
                            .frame(width: 100, height: 50)
                            .cornerRadius(50)
                            .foregroundColor(Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(treino.isTrainingCompleted ? Color.green : Color.orange, lineWidth: 2)
                            )
                            .padding(.bottom, 30)
                        }}
                }
            }
            
        }
    }
}
