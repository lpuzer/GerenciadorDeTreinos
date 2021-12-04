//
//  AddIndividualTraining.swift
//  GerenciadorDeTreinos
//
//  Created by Luciano Puzer on 28/11/21.
//

import SwiftUI
import Combine
import FirebaseAuth


struct AddIndividualTraining: View {
    
    
    @EnvironmentObject var mainViewModel:MainViewModel
    @EnvironmentObject var weekTrainingViewModel: WeekTrainingViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var selectedDays:[String] = []
    @State var showAlert:Bool = false
    
    init(){
        UITableView.appearance().backgroundColor = .systemOrange
    }
    
    var body: some View {
        ZStack {
            Form {
                VStack (alignment: .leading, spacing: 5){
                    Section{
                        Text("Nome do Treino")
                            .padding(.top)
                        TextField("ex: treino para ganhar massa muscular", text: $weekTrainingViewModel.initialWeekTraining.trainingName)
                            .padding(.horizontal)
                            .frame(width: 270, height: 40)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding(.bottom, 20)
                    }.font(.caption)
                    Spacer()
                    Section{
                        VStack (alignment: .center, spacing: 5){
                            Text("Escolha os dias da semana para esse treino")
                                .font(.caption)
                                .foregroundColor(Color.black)
                            List{
                                HStack (alignment: .top, spacing: 15) {
                                    ForEach(0..<weekTrainingViewModel.daysOfWeek.count){ index in
                                        VStack  {
                                            Button(action: {
                                                weekTrainingViewModel.daysOfWeek[index].isSelected = weekTrainingViewModel.daysOfWeek[index].isSelected ? false : true
                                                
                                                if weekTrainingViewModel.daysOfWeek[0].isSelected {
                                                    self.weekTrainingViewModel.initialWeekTraining.sunday = true
                                                    self.weekTrainingViewModel.initialWeekTraining.sundayDay = "Dom"
                                                }
                                                if weekTrainingViewModel.daysOfWeek[1].isSelected {
                                                    self.weekTrainingViewModel.initialWeekTraining.monday = true
                                                    self.weekTrainingViewModel.initialWeekTraining.mondayDay = "Seg"
                                                }
                                                if weekTrainingViewModel.daysOfWeek[2].isSelected {
                                                    self.weekTrainingViewModel.initialWeekTraining.twesday = true
                                                    self.weekTrainingViewModel.initialWeekTraining.twesdayDay = "Ter"
                                                }
                                                if weekTrainingViewModel.daysOfWeek[3].isSelected {
                                                    self.weekTrainingViewModel.initialWeekTraining.wednesday = true
                                                    self.weekTrainingViewModel.initialWeekTraining.wednesdayDay = "Qua"
                                                }
                                                if weekTrainingViewModel.daysOfWeek[4].isSelected {
                                                    self.weekTrainingViewModel.initialWeekTraining.thursday = true
                                                    self.weekTrainingViewModel.initialWeekTraining.thursdayDay = "Qui"
                                                }
                                                if weekTrainingViewModel.daysOfWeek[5].isSelected {
                                                    self.weekTrainingViewModel.initialWeekTraining.friday = true
                                                    self.weekTrainingViewModel.initialWeekTraining.fridayDay = "Sex"
                                                }
                                                if weekTrainingViewModel.daysOfWeek[6].isSelected {
                                                    self.weekTrainingViewModel.initialWeekTraining.saturday = true
                                                    self.weekTrainingViewModel.initialWeekTraining.sundayDay = "Sab"
                                                }
                                            }) {
                                                VStack (alignment: .center, spacing: 2){
                                                    if weekTrainingViewModel.daysOfWeek[index].isSelected {
                                                        Image(systemName: "checkmark.square")
                                                            .foregroundColor(.green)
                                                    } else {
                                                        Image(systemName: "square")
                                                            .foregroundColor(.primary)
                                                    }
                                                    Text(weekTrainingViewModel.daysOfWeek[index].day)
                                                        .font(.caption)
                                                        .foregroundColor(Color.black)
                                                }
                                            }.buttonStyle(BorderlessButtonStyle())
                                        }
                                    }
                                }
                                
                            }.frame(width: 270, height: 50, alignment: .center)
                        }
                    }.font(.caption)
                    Spacer()
                    Section{
                        HStack{
                            Spacer()
                            Button(action: {
                                if weekTrainingViewModel.initialWeekTraining.trainingName != "" {
                                    let cardsDay = WeekTraining(id: "",
                                                                userId: Auth.auth().currentUser?.uid,
                                                                trainingName: self.weekTrainingViewModel.initialWeekTraining.trainingName,
                                                                trainingId: self.mainViewModel.initialMainTraining.id,
                                                                sunday: self.weekTrainingViewModel.initialWeekTraining.sunday,
                                                                monday: self.weekTrainingViewModel.initialWeekTraining.monday,
                                                                twesday: self.weekTrainingViewModel.initialWeekTraining.twesday,
                                                                wednesday: self.weekTrainingViewModel.initialWeekTraining.wednesday,
                                                                thursday: self.weekTrainingViewModel.initialWeekTraining.thursday,
                                                                friday: self.weekTrainingViewModel.initialWeekTraining.friday,
                                                                saturday: self.weekTrainingViewModel.initialWeekTraining.saturday,
                                                                sundayDay: self.weekTrainingViewModel.initialWeekTraining.sundayDay,
                                                                mondayDay: self.weekTrainingViewModel.initialWeekTraining.mondayDay,
                                                                twesdayDay: self.weekTrainingViewModel.initialWeekTraining.twesdayDay,
                                                                wednesdayDay: self.weekTrainingViewModel.initialWeekTraining.wednesdayDay,
                                                                thursdayDay: self.weekTrainingViewModel.initialWeekTraining.thursdayDay,
                                                                fridayDay: self.weekTrainingViewModel.initialWeekTraining.fridayDay,
                                                                saturdayDay: self.weekTrainingViewModel.initialWeekTraining.saturdayDay)
                                    self.weekTrainingViewModel.addDayTraining(cardsDay)
                                }
                                self.weekTrainingViewModel.initialWeekTraining.trainingName = ""
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Salvar")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .frame(width: 120, height: 50)
                                    .cornerRadius(30)
                                    .foregroundColor(.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.orange, lineWidth: 2)
                                    )
                            }
                            Spacer()
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Cancelar")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .frame(width: 120, height: 50)
                                    .cornerRadius(30)
                                    .foregroundColor(.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.orange, lineWidth: 2)
                                    )
                            }
                            Spacer()
                        }.padding(.bottom, 10)
                    }.font(.caption)
                }.frame(height: 320)
            }.frame(width: 300, height: 400)
                .cornerRadius(30)
                .padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color("mainBackground")
                    .ignoresSafeArea()
            }
    }
    
    
}

struct AddIndividualTraining_Previews: PreviewProvider {
    static var previews: some View {
        AddIndividualTraining()
            .environmentObject(MainViewModel())
            .environmentObject(WeekTrainingViewModel())
    }
}
